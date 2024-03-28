//
//  ChatMessage.swift
//  Pint
//
//  Created by Jan Bannister on 28/03/2024.
//

import Foundation

// 1. Model for Chat Messages
struct ChatMessage: Identifiable {
    let id = UUID()
    let message: String
    let isUser: Bool // True if the message is from the user, false if from the other person.
}
