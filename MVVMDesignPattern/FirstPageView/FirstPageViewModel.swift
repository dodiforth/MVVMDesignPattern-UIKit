//
//  FirstPageViewModel.swift
//  MVVMDesignPattern
//
//  Created by Dowon Kim on 05/08/2023.
//

import Foundation

final class FirstPageViewModel {
    
    //Remember! the viewModel is going to contain properties, attributes and methods that are related to the view!
    //So it doesn't need to bring whatever it doesn't need.
    var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggedInUser() {
        let user = NetworkService.shared.getLoggedInUser()
        self.welcomeMessage.value = "Welcome, \(user.firstName) \(user.lastName) !"
    }
    
}
