//
//  ViewController.swift
//  test-autolay
//
//  Created by FELIPE AUGUSTO SILVA on 25/01/22.
//

import UIKit

class ViewController: UIViewController {
    
//    let yellowSquare = UIView()
//    yellowSquare.backgroundColor = .yellow
//
    let logoImage: UIImageView = {
        var bgImage: UIImageView?
        let image: UIImage = UIImage(named: "logo")!
        bgImage = UIImageView(image: image)
        let imageView = bgImage!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var textFieldUser: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        textField.backgroundColor = UIColor(red: 0.9686, green: 0.9686, blue: 0.9686, alpha: 1.0)
        textField.layer.cornerRadius = 14
        textField.placeholder = " Usuario"
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = CGColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
        textField.clearButtonMode = UITextField.ViewMode.always
        let image = UIImage(systemName: "bolt.fill")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var textFieldPass: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        textField.backgroundColor = UIColor(red: 0.9686, green: 0.9686, blue: 0.9686, alpha: 1.0)
        textField.layer.cornerRadius = 14
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = CGColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
        textField.clearButtonMode = UITextField.ViewMode.always
        textField.placeholder = " Senha"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
   
    private lazy var loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = CGColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
        button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 0.4
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)

        return button
    }()
    
    private lazy var ForgotButton: UIButton = {
       let button = UIButton()
        button.setTitle("Esqueci senha", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0), for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = CGColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = CGColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
        button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 0.4
        

        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layoutConfig()
    }
    
    private func layoutConfig() {
        
        
        let viewStack = UIView()
        view.addSubview(viewStack)
         viewStack.addSubview(logoImage)
        
        
        let fieldContainer = UIStackView(arrangedSubviews: [
            textFieldUser,textFieldPass, loginButton,ForgotButton
        ])
        fieldContainer.axis = .vertical
        fieldContainer.spacing = 18
        fieldContainer.translatesAutoresizingMaskIntoConstraints = false
        viewStack.addSubview(fieldContainer)
        
//        image
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: viewStack.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImage.centerXAnchor.constraint(equalTo: viewStack.centerXAnchor),
            logoImage.heightAnchor.constraint(equalTo: viewStack.heightAnchor, multiplier: 0.1),
            
            textFieldUser.heightAnchor.constraint(equalToConstant: 40),
            textFieldPass.heightAnchor.constraint(equalToConstant: 40),
            
            fieldContainer.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
            fieldContainer.centerXAnchor.constraint(equalTo: viewStack.centerXAnchor),
            fieldContainer.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor, constant: -20),
            fieldContainer.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor, constant: 20),
            
//            BUTTON

        ])
        
        

//        PARENT STACK
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            viewStack.topAnchor.constraint(equalTo: view.topAnchor),
            viewStack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }


    @objc func loginAction(sender: UIButton!) {
        let alert = UIAlertController(title: "Problema no Servidor", message: "Tente novamente mais tarde.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

