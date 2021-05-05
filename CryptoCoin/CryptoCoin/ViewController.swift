//
//  ViewController.swift
//  CryptoCoin
//
//  Created by Luiza Negreiros Naves - LNA on 05/05/21.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController{

    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }

    }


