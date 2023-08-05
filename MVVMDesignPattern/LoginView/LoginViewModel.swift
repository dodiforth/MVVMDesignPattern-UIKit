//
//  LoginViewModel.swift
//  MVVMDesignPattern
//
//  Created by Dowon Kim on 05/08/2023.
//

import Foundation
// Remember! Unlike MVC we cannot directly update the View
// Again. The ViewModel is independent of sort. So it's not knowing anything that's happening in the View(in the ViewController)
final class LoginViewModel {
    
    @Published var error: String?
    
    func login(email: String, password: String) {
        NetworkService.shared.longin(email: email, password: password) { [weak self] success in
            self?.error = success ? nil : "Error occurred! User cannot be found!"
        }
    }
}
