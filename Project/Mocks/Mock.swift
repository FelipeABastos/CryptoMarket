//
//  Mock.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import Foundation

class Mock {
    
    let fileManager = FileManager()
    
    static let shared = Mock()
    
    func load(type: MockType) -> Data? {
        var data: Data? = nil
        if let path = Bundle.main.path(forResource: type.rawValue, ofType: "json"),
            fileManager.fileExists(atPath: path) {
            data = fileManager.contents(atPath: path)
            self.log(data, type.rawValue)
        }
        return data
    }
    
    private func log(_ data: Data?, _ mock: String) {
        if let aux = data,
            let response = String(data: aux, encoding: String.Encoding.utf8) {
            print("\n==================== Loading Mock: \(mock) ====================\n")
            print(response)
            print("\n===============================================================\n")
        }
    }
}
