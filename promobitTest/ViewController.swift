//
//  ViewController.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 13/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAddContact: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddContact.cornerRadius = 50
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#00baff")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

    }


}

