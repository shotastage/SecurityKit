//
//  MD5.swift
//
//
//  Created by Shota Shimazu on 2023/09/13.
//

import Foundation

open class MD5: HashAlg {
    private let initialValues: [UInt32] = [0x6745_2301, 0xEFCD_AB89, 0x98BA_DCFE, 0x1032_5476]
}

extension Data {
    /// Returns MD5 hash as Data type (implementing the MD5 algorithm internally)
    func md5() -> Data {
        #if DEBUG
            print("⚠️ WARNING: MD5 is not secure for cryptographic purposes.")
            print("   It's vulnerable to collision attacks and should only be used")
            print("   for non-security purposes like checksums or file verification.")
        #endif

        // 1. Padding process
        // Add a "1" bit (0x80) to the original byte sequence,
        // fill with zeros until the block size (64 bytes) minus 8 bytes (56th byte),
        // then append the original message length (in bits, 8 bytes in little-endian).
        var message = [UInt8](self)
        let originalLength = message.count
        message.append(0x80) // 1000 0000

        // In a 64-byte block, the last 8 bytes are for message length, so pad with zeros until 56 bytes
        while (message.count % 64) != 56 {
            message.append(0)
        }

        // Append the original length (in bits) as a 64-bit little-endian value
        let bitLength = UInt64(originalLength) * 8
        for i in 0 ..< 8 {
            message.append(UInt8((bitLength >> (8 * i)) & 0xFF))
        }

        // 2. Initial values (four 32-bit integers defined in MD5 specification)
        var a: UInt32 = 0x6745_2301
        var b: UInt32 = 0xEFCD_AB89
        var c: UInt32 = 0x98BA_DCFE
        var d: UInt32 = 0x1032_5476

        // 3. Shift amounts (rotation bits used in each round)
        let s: [UInt32] = [
            // Round 1 (16 times)
            7, 12, 17, 22, 7, 12, 17, 22,
            7, 12, 17, 22, 7, 12, 17, 22,
            // Round 2 (16 times)
            5, 9, 14, 20, 5, 9, 14, 20,
            5, 9, 14, 20, 5, 9, 14, 20,
            // Round 3 (16 times)
            4, 11, 16, 23, 4, 11, 16, 23,
            4, 11, 16, 23, 4, 11, 16, 23,
            // Round 4 (16 times)
            6, 10, 15, 21, 6, 10, 15, 21,
            6, 10, 15, 21, 6, 10, 15, 21,
        ]

        // 4. Constants T[i] = floor(2^32 * abs(sin(i+1))) (i = 0...63)
        var T = [UInt32](repeating: 0, count: 64)
        for i in 0 ..< 64 {
            T[i] = UInt32(floor(4_294_967_296 * abs(sin(Double(i + 1)))))
        }

        // 5. Process each 512-bit (64-byte) block
        let blockCount = message.count / 64
        for i in 0 ..< blockCount {
            let blockStart = i * 64
            // Split into 16 32-bit words (little-endian)
            var M = [UInt32](repeating: 0, count: 16)
            for j in 0 ..< 16 {
                let index = blockStart + j * 4
                M[j] = UInt32(message[index]) |
                    (UInt32(message[index + 1]) << 8) |
                    (UInt32(message[index + 2]) << 16) |
                    (UInt32(message[index + 3]) << 24)
            }

            // Copy current state to temporary variables
            var A = a
            var B = b
            var C = c
            var D = d

            // 6. Main loop: 64 operations
            for k in 0 ..< 64 {
                var F: UInt32 = 0
                var g = 0
                if k < 16 {
                    // Round 1
                    F = (B & C) | ((~B) & D)
                    g = k
                } else if k < 32 {
                    // Round 2
                    F = (D & B) | ((~D) & C)
                    g = (5 * k + 1) % 16
                } else if k < 48 {
                    // Round 3
                    F = B ^ C ^ D
                    g = (3 * k + 5) % 16
                } else {
                    // Round 4
                    F = C ^ (B | ~D)
                    g = (7 * k) % 16
                }

                // MD5 update process (compliant with RFC 1321)
                let temp = D
                D = C
                C = B
                B = B &+ rotateLeft(A &+ F &+ M[g] &+ T[k], by: s[k])
                A = temp
            }

            // Add to each variable after block processing (modular addition)
            a = a &+ A
            b = b &+ B
            c = c &+ C
            d = d &+ D
        }

        // 7. Output result: concatenate a, b, c, d in little-endian to create 16-byte Data
        var digest = Data()
        for value in [a, b, c, d] {
            var littleEndian = value.littleEndian
            let bytes = Swift.withUnsafeBytes(of: &littleEndian) { Data($0) }
            digest.append(bytes)
        }
        return digest
    }
}

/// Left rotation (bit shift) function
private func rotateLeft(_ x: UInt32, by: UInt32) -> UInt32 {
    return (x << by) | (x >> (32 - by))
}
