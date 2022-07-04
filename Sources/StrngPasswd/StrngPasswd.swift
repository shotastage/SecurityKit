//
//  StrngPasswd.swift
//
//
//  Created by Shota Shimazu on 2022/05/01.
//

import Foundation


public typealias PasswdStrength = Int

public enum PasswdResult: Equatable {
    case weak
    case medium
    case strong
    case unknown
}

public enum CheckCondition: Equatable {
    case containLowercaseAlphabet
    case containUppercaseAlphabet
    case containNumericCharactors
    case containSymbolCharactors
    case containNumericMinimum(_ min: Int)
}

public enum InvalidCondition: Equatable {
    case uppercaseNotContained
    case lowwercaseNotContained
    case numericCharactorNotContained
    case symbolCharactorsNotContained
    case notEnoughCharacters
    case noInvalidation
}

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

extension StrngPasswd {

    private func evokeJudge(condition: CheckCondition) -> InvalidCondition {

        switch condition {
        case .containUppercaseAlphabet:
            if !isContainUppercase {
                return .uppercaseNotContained
            }
        case .containLowercaseAlphabet:
            if !isContainLowercase {
                return .lowwercaseNotContained
            }
        case .containNumericCharactors:
            if !isContainNumeric {
                return .numericCharactorNotContained
            }
        case .containSymbolCharactors:
            if !isContainSymblic {
                return .symbolCharactorsNotContained
            }
        case .containNumericMinimum(let minimum):
            if !isNumericMinimum(minimum) {
                return .notEnoughCharacters
            }
        }

        return .noInvalidation
    }

    private var isContainUppercase: Bool {
        var contain: Bool = false

        self.evaluatePasswd.forEach { char in
            if (char.isUppercase) {
                contain = true
            }
        }

        return contain
    }

    private var isContainLowercase: Bool {
        var contain: Bool = false

        self.evaluatePasswd.forEach { char in
            if (char.isLowercase) {
                contain = true
            }
        }

        return contain
    }

    private var isContainNumeric: Bool {
        var contain: Bool = false

        self.evaluatePasswd.forEach { char in
            if (Double(String(describing: char)) != nil) {
                contain = true
            }
        }

        return contain
    }

    private var isContainSymblic: Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: String(self.evaluatePasswd), options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.evaluatePasswd.count)) {
                return true
            }

        } catch {
            return false
        }

        return false
    }

    private func isNumericMinimum(_ min: Int) -> Bool {
        
        if self.evaluatePasswd.count >= min {
            return true
        }

        return false
    }
}
