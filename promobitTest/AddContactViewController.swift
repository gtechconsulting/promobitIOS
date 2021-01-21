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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
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
        spinner.isHidden = true
        
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
            spinner.isHidden = false
            self.salvarContato()
        }else {
            emailErrorField.isHidden = false
        }

    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func salvarContato() {
        let url = URL(string: "https://5ff85fad10778b0017043359.mockapi.io/api/contatos")
        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        struct NewContact: Codable {
            var name: String
            var company: String
            var email: String
            var website: String
            var custom_note: String
        }
        
        let newContat = NewContact(name: nomeField.text ?? "", company: empresaField.text ?? "", email: emailField.text ?? "", website: siteField.text ?? "", custom_note: notaField.text ?? "")
    
        do {
          let jsonData = try JSONEncoder().encode(newContat)
            
            request.httpBody = jsonData

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    self.spinner.isHidden = true
                }
                
                    if let error = error {
                        print("Error took place \(error)")
                        return
                    }
             
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        
                        DispatchQueue.main.async {
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let successVC = storyBoard.instantiateViewController(withIdentifier: "SuccessViewController") as! SuccessViewController

                            self.navigationController?.pushViewController(successVC, animated: true)
                        }
                    }
            }
            task.resume()
        }catch {
            print("erro")
        }
    }

}
