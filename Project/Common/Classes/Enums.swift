//
//  Enums.swift
//  CryptoMarket
//
//  Created by Felipe Amorim Bastos on 13/01/23.
//  Copyright © 2023 Felipe Amorim. All rights reserved.
//

import Foundation

//------------------------------------------------------------
//	Struct: APIHelper
//------------------------------------------------------------

enum ResponseError: Error {
	case none
	case unknown
	case invalidCredentials
}

//-----------------------------------------------------------------------
//  Struct: Mock
//-----------------------------------------------------------------------

enum MockType: String {
    case error
    case exchanges
    case exchangesIcons
}
