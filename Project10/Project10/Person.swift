//
//  Person.swift
//  Project10
//
//  Created by 홍성범 on 2023/06/11.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
