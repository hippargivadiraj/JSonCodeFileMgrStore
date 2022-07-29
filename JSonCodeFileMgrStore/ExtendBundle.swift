//
//  ExtendBundle.swift
//  JSonCodeFileMgrStore
//
//  Created by Vadiraj Hippargi on 7/28/22.
//

import Foundation
extension Bundle {
    static func load<T: Decodable>(_ filename: String) -> T {

        let readURL = Bundle.main.url(forResource: filename, withExtension: "json")! //Example json file in our bundle
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // Initializing the url for the location where we store our data in filemanager

        let jsonURL = documentDirectory // appending the file name to the url
            .appendingPathComponent(filename)
            .appendingPathExtension("json")

        // The following condition copies the example file in our bundle to the correct location if it isnt present
        if !FileManager.default.fileExists(atPath: jsonURL.path) {
            try? FileManager.default.copyItem(at: readURL, to: jsonURL)
        }
        
        //4. Create a property for decoded data
        guard let decodedData = try? JSONDecoder().decode(T.self, from: Data(contentsOf: jsonURL)) else{
            fatalError(" Failed to decode File: from bundle")
        }

        // returning the parsed data
        return decodedData
    }
}
