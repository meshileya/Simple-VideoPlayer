//
//  CustomIframeVideoLoader.swift
//  VideoPlayer
//
//  Created by TECHIES on 3/10/19.
//  Copyright © 2019 TECHIES. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class CustomIframeViewController : UIViewController, WKNavigationDelegate, ControllerDelegate {
    let webView = WKWebView()
    var browserUrl : VideoDetailsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.title = browserUrl?.name
        self.view.backgroundColor = UIColor.white
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        initViews()
        
    }
    
    func initViews(){
        webView.navigationDelegate = self
        view = webView
        initData()
    }
    
    func initData(){
        guard
            let url = URL(string: browserUrl?.link ?? "https://www.letsbuildthatapp.com/") else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Started Loadinng...")
        self.showProgress("Loading...")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideProgress()
        print("Done Loading...")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Error Occured")
        self.hideProgress()
    }
}
