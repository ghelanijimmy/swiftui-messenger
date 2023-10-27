//
//  Message.swift
//  Messenger
//
//  Created by Jimmy Ghelani on 2023-10-25.
//

import Foundation

enum MessageType: String {
    case sent
    case received
}

struct Message: Hashable {
    let text: String
    let type: MessageType
    let created: Date
}
