//
//  FirstPageViewController.swift
//  MVVMDesignPattern
//
//  Created by Dowon Kim on 05/08/2023.
//

import UIKit
import Combine

class FirstPageViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    // Reference to its viewModel
    private let viewModel = FirstPageViewModel()
    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        viewModel.getLoggedInUser()
    }
    
    private func setupBinders() {
        viewModel.$welcomeMessage.sink { [weak self] message in
            self?.mainLabel.text = message
        }.store(in: &cancellables)
    }
    
}
