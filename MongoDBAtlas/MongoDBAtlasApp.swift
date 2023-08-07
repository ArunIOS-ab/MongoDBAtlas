//
//  MongoDBAtlasApp.swift
//  MongoDBAtlas
//
//  Created by AB on 27/07/23.
//

import SwiftUI
import RealmSwift

let realmApp = RealmSwift.App(id: "APP_ID")

@main
struct MongoDBAtlasApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
