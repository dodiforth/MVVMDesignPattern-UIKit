//
//  FirstPageViewController.swift
//  MVVMDesignPattern
//
//  Created by Dowon Kim on 05/08/2023.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    // Reference to its viewModel
    private let viewModel = FirstPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        viewModel.getLoggedInUser()
    }
    
    private func setupBinders() {
        viewModel.welcomeMessage.bind { [weak self] message in
            self?.mainLabel.text = message
        }
    }
    
}
