//
//  CollectionModel.swift
//  TestUIElement
//
//  Created by SalinChhun on 15/12/23.
//

import Foundation

struct CollectionModel {
    var id: Int?
    var name: String?
    var image: String?
    var gender: String?
    var age: Int?
    var role: String?
}

var arrCollection = [
    CollectionModel(id: 1, name: "Salin", image: "salin", gender: "Male", age: 22, role: "Web Developer"),
    CollectionModel(id: 2, name: "Ka Pheak", image: "pheak", gender: "Male", age: 22, role: "Physic Teacher"),
    CollectionModel(id: 3, name: "Sokha Makara", image: "makara", gender: "Female", age: 20, role: "Accounting"),
    CollectionModel(id: 4, name: "Davin", image: "kvin", gender: "Male", age: 21, role: "Business"),
    CollectionModel(id: 5, name: "Doch", image: "doch", gender: "Male", age: 24, role: "IT Instructor")
]
