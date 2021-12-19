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
        User(login: "1",
             password: "1",
             about: Person(firstname: "Артем",
                           lastname: "Черненко",
                           age: 34,
                           about: "Родной город Оренбург. Переехал в Москву 12 лет назад. Работаю в правительстве Москвы. Программированием увлекался давно и даже учился на факультете разработки программного обеспечения, но это было давно и даже тогда знания там давали неактуальные. Пришло время попробовать освоить профессию и заняться чем то действительно полезным)",
                           contacts: .init(type: .email,
                                           link: "artem_chernenko@icloud.com")))
    }
}

struct Person {
    let firstname: String
    let lastname: String
    let age: Int
    let about: String
    let contacts: Contact
}

struct Contact {
    let type: TypeContact
    let link: String
}

enum TypeContact: String {
    case email = "email"
    case phoneNumber = "Phone:"
    case socialNetwork = "??" //еще не придумал как, но можно
                              //будет сделать лого соц.сети
                              //тогда это не в enum должно быть
}
