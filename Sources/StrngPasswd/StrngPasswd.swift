
public enum PasswdResult {
    case weak
    case medium
    case strong
    case unknown
}

public enum PasswdConditions {
    case containCapitalCaseAlphabet
    case containSmallCaseAlphabet
    case containNumericCharactors
    case containSymbolCharactors
    case containNumericMinimum
}

open class StrngPasswd {
    
    func validate(conditions: Array<PasswdConditions>) -> PasswdResult {
        return .medium
    }
}
