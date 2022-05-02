//
//  StrngPasswd.swift
//
//
//  Created by Shota Shimazu on 2022/05/01.
//

public enum PasswdResult: Equatable {
    case weak
    case medium
    case strong
    case unknown
}

public enum PasswdConditions: Equatable {
    case containCapitalCaseAlphabet
    case containLowerCaseAlphabet
    case containNumericCharactors
    case containSymbolCharactors
    case containNumericMinimum
}

open class StrngPasswd {
    
    let evaluatePasswd: Array<Character>
    
    init(passwd: String) {
        evaluatePasswd = Array(passwd)
    }

    func validate(conditions: Array<PasswdConditions>) -> PasswdResult {
        return .medium
    }
}

extension StrngPasswd {

    fileprivate func conditionValidate(conditions: Array<PasswdConditions>) -> PasswdResult {
        return .medium
    }

    private var isContainCapital: Bool {
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
        return true
    }

    private var isContainSymblic: Bool {
        return true
    }
}
