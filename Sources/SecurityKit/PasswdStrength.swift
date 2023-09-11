//
//  PasswdStrength.swift
//  
//
//  Created by Shota Shimazu on 2022/07/04.
//

import Foundation


public typealias PasswdStrength = Int

public enum PasswdResult: Equatable {
    case weak
    case medium
    case strong
    case unknown
}

extension CSPasswordUtils {

}

open class Zxcvbn {
    let matcher: String
    let scorer: String

    init(matcher: String, scorer: String) {
        self.matcher = matcher
        self.scorer = scorer
    }
}
