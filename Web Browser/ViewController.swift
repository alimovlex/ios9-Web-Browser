//
//  ViewController.swift
//  Web Browser
//
//  Created by Chris Archibald on 12/1/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var address: String = String()
    
    @IBOutlet weak var webAddress: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webAddress.delegate = self
        webView.scalesPageToFit = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /***** TextField Delegate Methods *****/
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //This will make the keyboard go away
        webAddress.resignFirstResponder()
        loadWebPage()
        return true
    }
    
    /***** Helper Functions *****/
    func loadWebPage() {
        if webAddress.text != "" {
            address = address.trimmingCharacters(in: CharacterSet.whitespaces); //stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            address = self.webAddress.text!
            if address.hasPrefix("www.") {
                address = "http://" + address
            } else if !address.hasPrefix("http://") {
                address = "http://" + address
            }
            let url = URL(string: address)
            let request = URLRequest(url: url!)
            webView.loadRequest(request)
        }
    }

    /***** UI Button Press Methods *****/
    @IBAction func goPressed(sender: AnyObject) {
        webAddress.resignFirstResponder()
        loadWebPage()
    }

    @IBAction func backPressed(sender: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func forwardPressed(sender: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func zoomOutPressed(sender: AnyObject) {
        webView.scrollView.zoomScale -= 0.2
    }
    
    @IBAction func zoomInPressed(sender: AnyObject) {
        webView.scrollView.zoomScale += 0.2
    }
    
}

