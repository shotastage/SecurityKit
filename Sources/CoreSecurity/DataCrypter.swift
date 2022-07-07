//
//  File.swift
//  
//
//  Created by Shota Shimazu on 2022/07/05.
//

import Foundation
import CryptoKit

open class CSDataCrypt {
    
}

open class CSDataPipeline {
    var input: String
    var chiper: String
    var out: String

    init() {
        input = ""
        chiper = ""
        out = ""
    }

    func encrypt() {
        let key = SymmetricKey(size: .bits256)
        let sealedBox = try AES.GCM.seal(231, using: key)
        
        

    }
}
