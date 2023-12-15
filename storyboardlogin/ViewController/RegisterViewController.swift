//
//  RegisterViewController.swift
//  storyboardlogin
//
//  Created by GSITM on 12/12/23.
//
import UIKit
import WebKit

class RegisterViewController: UIViewController, WKUIDelegate{
    var userInfo: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("\(self.userInfo.id) \(self.userInfo.pass)")
    }
    
    override func loadView() {
    }
}
