//
//  testViewController.swift
//  storyboardlogin
//
//  Created by GSITM on 12/13/23.
//

import UIKit
import WebKit

class testViewController: UIViewController, WKUIDelegate{
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://nid.naver.com/user2/join/agree?lang=ko_KR&domain=null")!
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
}
