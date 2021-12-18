//
//  User.swift
//  LoginApp_HW_3
//
//  Created by Артем Черненко on 17.12.2021.
//

struct User {
    let login: String
    let password: String
    let about: Person
    
    static func getUser() -> User {
        User(login: "admin",
             password: "admin",
             about: Person(firstname: "Имя",
                           lastname: "Фамилия",
                           age: 30,
                           about: "Выяснить сколько максимум символов помещается в строку",
                           contact: "контакт. Доработать на тип контакта(имейл, телефон, инстаграмм, другое)")
        )
    }
}

struct Person {
    let firstname: String
    let lastname: String
    let age: Int
    let about: String
    let contact: String
}
