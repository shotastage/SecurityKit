//
//  PasswdUtil.swift
//
//
//  Created by Shota Shimazu on 2022/07/05.
//

import Foundation

open class CSPasswordUtils {
    let evaluatePasswd: [Character]

    public init(passwd: String) {
        evaluatePasswd = Array(passwd)
    }

    public func validate(policies: [PosswordPolicy]) -> [InvalidPolicy] {
        var invalidPolicies: [InvalidPolicy] = []

        for policy in policies {
            if evokeJudge(condition: policy) != .noInvalidation {
                invalidPolicies.append(evokeJudge(condition: policy))
            }
        }

        return invalidPolicies
    }

    #if os(iOS)
        public func generatePass(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let symbols = "~!#$%&"

            return String((0 ..< length).map { _ in (letters + symbols).randomElement()! })
        }
    #endif

    private func checkStrength() -> PasswdStrength {
        return 1
    }
}
