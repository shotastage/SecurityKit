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
