//
//  MD5.swift
//
//
//  Created by Shota Shimazu on 2023/09/13.
//

import Foundation

open class MD5: HashAlg {
    private let initialValues: Array<UInt32> = [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476]
}
