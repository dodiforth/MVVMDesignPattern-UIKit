//
//  Users.swift
//  MVVMDesignPattern
//
//  Created by Dowon Kim on 05/08/2023.
//

import Foundation

struct User {
    let firstName, lastName, email: String
    let age: Int
}
/*
This is our object BUT!!!! User objects can be crazy huge
 <- So this is where ViewModel will be really helpful because
 out of 30 different attributes I'd only need couple of those like 2 of them.
 */
