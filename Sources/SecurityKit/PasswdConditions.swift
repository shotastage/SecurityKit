//
//  PasswdConditions.swift
//
//
//  Created by Shota Shimazu on 2022/07/04.
//

import Foundation

public enum PosswordPolicy: Equatable {
    case containLowercaseAlphabet
    case containUppercaseAlphabet
    case containNumericCharactors
    case containSymbolCharactors
    case containNumericMinimum(_ min: Int)
}

public enum InvalidPolicy: Equatable {
    case uppercaseNotContained
    case lowwercaseNotContained
    case numericCharactorNotContained
    case symbolCharactorsNotContained
    case notEnoughCharacters
    case noInvalidation
}

extension CSPasswordUtils {
    func evokeJudge(condition: PosswordPolicy) -> InvalidPolicy {
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
        case let .containNumericMinimum(minimum):
            if !isNumericMinimum(minimum) {
                return .notEnoughCharacters
            }
        }

        return .noInvalidation
    }

    private var isContainUppercase: Bool {
        var contain = false

        for char in evaluatePasswd {
            if char.isUppercase {
                contain = true
            }
        }

        return contain
    }

    private var isContainLowercase: Bool {
        var contain = false

        for char in evaluatePasswd {
            if char.isLowercase {
                contain = true
            }
        }

        return contain
    }

    private var isContainNumeric: Bool {
        var contain = false

        for char in evaluatePasswd {
            if Double(String(describing: char)) != nil {
                contain = true
            }
        }

        return contain
    }

    private var isContainSymblic: Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: String(evaluatePasswd), options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, evaluatePasswd.count)) {
                return true
            }

        } catch {
            return false
        }

        return false
    }

    private func isNumericMinimum(_ min: Int) -> Bool {
        if evaluatePasswd.count >= min {
            return true
        }

        return false
    }
}
