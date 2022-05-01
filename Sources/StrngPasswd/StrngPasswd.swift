public struct StrngPasswd {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}


public enum PasswdConditions {
    case containCapitalCaseAlphabet
    case containSmallCaseAlphabet
    case containNumericCharactors
    case containSymbolCharactors
    case containNumericMinimum
}
