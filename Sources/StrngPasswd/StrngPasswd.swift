//
//  StrngPasswd.swift
//
//
//  Created by Shota Shimazu on 2022/05/01.
//

import Foundation


public enum PasswdResult: Equatable {
    case weak
    case medium
    case strong
    case unknown
}

typealias PasswdStrength = Int

public enum PasswdConditions: Equatable {
    case containLowercaseAlphabet
    case containUppercaseAlphabet
    case containNumericCharactors
    case containSymbolCharactors
    case containNumericMinimum
}

public enum PasswdInvalidCondition: Equatable {
    case uppercaseNotContained
    case lowwercaseNotContained
    case numericCharactorNotContained
    case symbolCharactorsNotContained
    case noInvalidation
}

open class StrngPasswd {

    let evaluatePasswd: Array<Character>

    init(passwd: String) {
        evaluatePasswd = Array(passwd)
    }

    func validate(conditions: Array<PasswdConditions>) -> PasswdConditions {
        return .containUppercaseAlphabet
    }
    
    func checkStrength() -> PasswdStrength {
        return 1
    }
}

extension StrngPasswd {

    fileprivate func conditionValidate(conditions: Array<PasswdConditions>) -> PasswdConditions {
        let condition = conditions[0]

        return .containUppercaseAlphabet
    }

    private func evokeJudge(condition: PasswdConditions) -> PasswdInvalidCondition {

        switch condition {
        case .containUppercaseAlphabet:
            if isContainUppercase {
                return .uppercaseNotContained
            }
        case .containLowercaseAlphabet:
            if isContainLowercase {
                return .lowwercaseNotContained
            }
        case .containNumericCharactors:
            if isContainNumeric {
                return .numericCharactorNotContained
            }
        case .containSymbolCharactors:
            if isContainSymblic {
                return .symbolCharactorsNotContained
            }
        case .containNumericMinimum:
            print()
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
