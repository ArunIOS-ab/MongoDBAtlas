//
//  MongoDBAtlasApp.swift
//  MongoDBAtlas
//
//  Created by AB on 27/07/23.
//

import SwiftUI
import RealmSwift

let realmApp = RealmSwift.App(id: "64c1d385c5b24a1503627507")

@main
struct MongoDBAtlasApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
