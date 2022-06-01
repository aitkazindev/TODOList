//
//  TaskItem.swift
//  TODOList
//
//  Created by Ibrahim Aitkazin on 01.06.2022.
//

import UIKit

class TaskItem: Codable {
    
    var task: String!
    var isComplete: Bool!
    
    init() {
        task = ""
        isComplete = false
    }
}
