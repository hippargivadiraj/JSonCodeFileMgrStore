//
//  JSonCodeFileMgrStoreApp.swift
//  JSonCodeFileMgrStore
//
//  Created by Vadiraj Hippargi on 7/28/22.
//

import SwiftUI

@main
struct jsonExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(jsonData()) // Creating an instance of jsonData that we pass to the content view
        }
    }
}
