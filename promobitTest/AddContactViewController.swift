//
//  AddContactViewController.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 21/01/21.
//

import Foundation
import UIKit

class AddContactViewController: UIViewController {
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveContactBtn: UIButton!
    @IBOutlet weak var notaField: CustomTextField!
    @IBOutlet weak var siteField: CustomTextField!
    @IBOutlet weak var phoneField: CustomTextField!
    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var empresaField: CustomTextField!
    @IBOutlet weak var nomeField: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelBtn.addTarget(self, action: #selector(btnCancelClicked), for: .touchUpInside)
        saveContactBtn.addTarget(self, action: #selector(btnSaveContactClicked), for: .touchUpInside)
    }
    
    @objc func btnCancelClicked() {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    @objc func btnSaveContactClicked() {
        
    }

}
