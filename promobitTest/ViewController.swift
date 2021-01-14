//
//  ViewController.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 13/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAddContact: RoundButton!
    
    @IBOutlet weak var noContactsView: UIView!
    @IBOutlet weak var noContactsImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startComponents()
    }
    
    func startComponents() {
        btnAddContact.cornerRadius = 50
        noContactsImg.image = UIImage(named: "sad")
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#00baff")
        noContactsView.isHidden = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }


}

