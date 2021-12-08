//
//  Card.swift
//  FlashZilla
//
//  Created by Yash Poojary on 08/12/21.
//

import Foundation


struct Card {
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor who?", answer: "Jodie Whittaker")
    }
}
