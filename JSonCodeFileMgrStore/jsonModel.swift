//
//  jsonModel.swift
//  JSonCodeFileMgrStore
//
//  Created by Vadiraj Hippargi on 7/28/22.
//

import Foundation

struct jsonModel: Hashable, Codable, Identifiable {
    var id: UUID
    var valueOne: String
    var valueTwo: String
}
