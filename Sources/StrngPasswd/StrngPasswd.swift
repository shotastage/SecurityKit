//
//  StrngPasswd.swift
//
//
//  Created by Shota Shimazu on 2022/05/01.
//

public enum PasswdResult {
    case weak
    case medium
    case strong
    case unknown
}

public enum PasswdConditions {
    case containCapitalCaseAlphabet
    case containLowerCaseAlphabet
    case containNumericCharactors
    case containSymbolCharactors
    case containNumericMinimum
}

open class StrngPasswd {
    
    let evaluatePasswd: String
    
    init(passwd: String) {
        evaluatePasswd = passwd
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
        return true
    }
    
    private var isContainLowercase: Bool {
        return true
    }

    private var isContainNumeric: Bool {
        return true
    }

    private var isContainSymblic: Bool {
        return true
    }
}
