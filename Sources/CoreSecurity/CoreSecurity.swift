//
//  StrngPasswd.swift
//
//
//  Created by Shota Shimazu on 2022/05/01.
//

import Foundation

public struct CoreSecurity { }

open class StrngPasswd {

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

    private func checkStrength() -> PasswdStrength {
        return 1
    }
}
