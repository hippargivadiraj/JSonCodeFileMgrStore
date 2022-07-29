//
//  jsonData.swift
//  JSonCodeFileMgrStore
//
//  Created by Vadiraj Hippargi on 7/28/22.
//

import Foundation

class jsonData: ObservableObject {
    @Published var jsonArray : [jsonModel] // The Published wrapper marks this value as a source of truth for the view

    init() {
        self.jsonArray = Bundle.load("list") // Initailizing the array from a json file
    }

    // function to write the json data into the file manager
    func writeJSON() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let jsonURL = documentDirectory
            .appendingPathComponent("list")
            .appendingPathExtension("json")
        try? JSONEncoder().encode(jsonArray).write(to: jsonURL, options: .atomic)
    }
}
