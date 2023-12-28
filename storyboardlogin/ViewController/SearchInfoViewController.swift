//
//  SearchInfoViewController.swift
//  storyboardlogin
//
//  Created by GSITM on 12/12/23.
//
import UIKit

class SearchInfoViewController: UIViewController{
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!

    @IBOutlet weak var hiddenStackView: UIStackView!
    @IBOutlet weak var hiddenPassTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView(){
        passTextField.layer.borderColor = UIColor.black.cgColor
        passTextField.layer.borderWidth = 0.5
        passTextField.layer.cornerRadius = 5

        hiddenPassTextField.layer.borderColor = UIColor.black.cgColor
        hiddenPassTextField.layer.borderWidth = 0.5
        hiddenPassTextField.layer.cornerRadius = 5
        
        idTextField.layer.borderColor = UIColor.black.cgColor
        idTextField.layer.borderWidth = 0.5
        idTextField.layer.cornerRadius = 5
    }
    
    @IBAction func touchDragEnterPass(_ sender: Any) {
        print("touchDragEnterPass 1")
    }
    
    @IBAction func touchUpInsidePass(_ sender: Any) {
        print("touchUpInsidePass 1")
    }
    
    @IBAction func passTextChange(_ sender: Any) {
        print("passTextChange 1")
        hiddenStackView.isHidden = false
    }
    
    @IBAction func tapGesutreRecognizer(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
