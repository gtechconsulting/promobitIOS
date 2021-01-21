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
    @IBOutlet weak var emailErrorField: UILabel!
    @IBOutlet weak var nomeField: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailErrorField.isHidden = true
        
        cancelBtn.addTarget(self, action: #selector(btnCancelClicked), for: .touchUpInside)
        saveContactBtn.addTarget(self, action: #selector(btnSaveContactClicked), for: .touchUpInside)
        phoneField.addTarget(self, action: #selector(phonePressed), for: .editingChanged)

    }
    
    @objc func phonePressed() {
        guard let text = phoneField.text else { return }
        
        phoneField.text = text.applyPatternOnNumbers(pattern: "(##) #####-####", replacmentCharacter: "#")
    }
    
    @objc func btnCancelClicked() {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    @objc func btnSaveContactClicked() {
        
        if(isValidEmail(email: emailField.text ?? "")){
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let successVC = storyBoard.instantiateViewController(withIdentifier: "SuccessViewController") as! SuccessViewController

            self.navigationController?.pushViewController(successVC, animated: true)
        }else {
            emailErrorField.isHidden = false
        }

    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
