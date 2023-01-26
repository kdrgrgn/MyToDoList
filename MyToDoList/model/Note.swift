//
//  Note.swift
//  MyToDoList
//
//  Created by kadir on 26.01.2023.
//

import Foundation

struct Note : Codable {
    var id : String
    var note : String
    var title : String
    var categoryId : String
    var date : Date
}
