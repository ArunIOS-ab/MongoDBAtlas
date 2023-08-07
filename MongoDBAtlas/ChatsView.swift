//
//  ChatsView.swift
//  MongoDBAtlas
//
//  Created by AB on 27/07/23.
//

import SwiftUI
import RealmSwift

struct ChatsView: View {
    @ObservedResults(ChatMessage.self, sortDescriptor: SortDescriptor(keyPath: "timestamp", ascending: true)) var chats
    
    let username: String
    let room: String
    
    @FocusState var isTextFocussed: Bool
    
    @State private var message = ""
    
    var body: some View {
        VStack {
            ForEach(chats) { chatMessage in
                HStack {
                    if chatMessage.author == username { Spacer() }
                    Text(chatMessage.text)
                    if chatMessage.author != username { Spacer() }
                }
                .padding(4)
            }
            Spacer()
            HStack {
                TextField("New message", text: $message)
                    .padding(8)
                    .background(Color.yellow)
                    .clipShape(Capsule())
                    .focused($isTextFocussed)
                    .onSubmit(send)
                    .submitLabel(.send)
                Button(action: send) { Image(systemName: "paperplane.fill") }
                    .disabled(message == "")
            }
        }
        .navigationBarTitle("\(room) messages", displayMode: .inline)
        .padding()
    }
    
    func send() {
        $chats.append(ChatMessage(author: username, text: message, room: room))
        message = ""
        isTextFocussed = true
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatsView(username: "billy@clusterdb.com", room: "Test room")
        }
    }
}


class ChatMessage: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var room: String
    @Persisted var author: String
    @Persisted var text: String
    @Persisted var timestamp = Date()

    convenience init(author: String, text: String, room: String) {
        self.init()
        self.author = author
        self.text = text
        self.room = room
    }
}
