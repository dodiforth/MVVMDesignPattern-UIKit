//
//  NetworkService.swift
//  MVVMDesignPattern
//
//  Created by Dowon Kim on 05/08/2023.
//


/*
 This file is goint to simulate as a back-end.
 */
import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private var user: User?
    
    private init() { }
    
    func longin(email: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if email == "dummy@test.com" && password == "password" {
                self?.user = User(firstName: "Rick", lastName: "Sanchez", email: "dummy@test.com", age: 70)
                completion(true)
            } else {
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggedInUser() -> User {
        return user!
    }
}

