//
//  ViewController.swift
//  storyboardlogin
//
//  Created by GSITM on 12/12/23.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    @IBAction func loginBtn(){
        guard let id = idTextField.text, !id.isEmpty else{
            showAlert(message: "ID가 비었네?")
            return
        }
        
        guard let pass = passTextField.text, !pass.isEmpty else{
            showAlert(message: "PASS가 비었네?")
            return
        }
    }
    
    private func userInfo() -> UserInfo?{
        return UserInfo(id: idTextField.text!, pass: passTextField.text!)
    }
    
    func initView(){
        passTextField.layer.borderColor = UIColor.black.cgColor
        passTextField.layer.borderWidth = 0.5
        passTextField.layer.cornerRadius = 5
        
        idTextField.layer.borderColor = UIColor.black.cgColor
        idTextField.layer.borderWidth = 0.5
        idTextField.layer.cornerRadius = 5
    }

    func showAlert(message: String){
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func tapGesutureRecognizer(_ sender: UITapGestureRecognizer) {
        print("tapGesutureRecognizer")
        self.view.endEditing(true)
    }
}

