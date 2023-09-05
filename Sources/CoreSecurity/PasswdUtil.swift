//
//  PasswdUtil.swift
//  
//
//  Created by Shota Shimazu on 2022/07/05.
//

import Foundation


open class CSPasswordUtils {

    let evaluatePasswd: Array<Character>

    public init(passwd: String) {
        evaluatePasswd = Array(passwd)
    }

    public func validate(conditions: Array<CheckCondition>) -> Array<InvalidCondition> {
        var invalidConditions: Array<InvalidCondition> = []

        for condition in conditions {
            if evokeJudge(condition: condition) != .noInvalidation {
                invalidConditions.append(evokeJudge(condition: condition))
            }
        }

        return invalidConditions
    }

    #if os(iOS)
    public func generatePass(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let symbols = "~!#$%&"

        return String((0..<length).map { _ in (letters + symbols).randomElement()! })
    }
    #endif

    private func checkStrength() -> PasswdStrength {
        return 1
    }
}
