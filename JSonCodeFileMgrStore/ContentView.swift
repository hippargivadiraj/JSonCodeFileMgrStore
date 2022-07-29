//
//  ContentView.swift
//  JSonCodeFileMgrStore
//
//  Created by Vadiraj Hippargi on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var jsonData: jsonData

    var body: some View {
        NavigationView {
            Form {
                ForEach(jsonData.jsonArray) { jsonItem in
                    Menu(content: {
                        Button(action: {
                            jsonData.jsonArray.removeAll(where: { $0.id == jsonItem.id })
                            jsonData.writeJSON()
                        }, label: {
                            Label("Delete", systemImage: "trash")
                        })
                    }, label: {
                        VStack(alignment: .leading) {
                            Text(jsonItem.valueOne)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.primary)
                            Text(jsonItem.valueTwo)
                                .foregroundColor(.primary)
                        }
                    })
                }
            }
            .navigationTitle("Json example")
            .navigationBarItems(trailing:NavigationLink(destination: NewItem(),label: {Image(systemName: "plus").imageScale(.large)}))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
