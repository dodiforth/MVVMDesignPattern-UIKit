//
//  ViewController.swift
//  MVVMDesignPattern
//
//  Created by Dowon Kim on 05/08/2023.
//

/*
 I know, it's confusing but here is some stuffs to set.
 We still see the name ViewController here(UIkit basically tangled into Storyboard View and ViewController).
 But just imagine this as a view
 then we're going to have a viewModel, and a model as separate files.
 */

import UIKit
import Combine

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    // 👇 instance of the ViewModel <- meaning View is aware of the ViewModel!(Why? Because it need to be able to connect with the attributes that are in the ViewModel)
    private let viewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
    }
    
    // When loginButton is tapped, @IBAction func loginButtonTapped is going to use viewModel to perform a login.
    // But viewModel doesn't update directly to the view. So how's the view is going to know that the viewModel has changed(or perfomed)?
    // This is where this function below to come in 👇
    private func setupBinders() {
        //Bind to whatever the objects it wants to listens to
        viewModel.$error.sink { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToFirstPage()
            }
        }.store(in: &cancellables)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailField.text,
              let password = passwordField.text else {
            print("Type email and password!")
            return
        }
        viewModel.login(email: email, password: password)
    }
    
    private func goToFirstPage() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "FirstPageViewController") as? FirstPageViewController else { return }
        //controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    // lower virtual keyboard when the negative space is clicked.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

