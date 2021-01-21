//
//  ViewController.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 13/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAddContact: RoundButton!
    @IBOutlet weak var contactTable: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var noContactsView: UIView!
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddContact.cornerRadius = 50
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#00baff")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        self.contactTable.delegate = self
        self.contactTable.dataSource = self
        self.contactTable.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "tableCell")

        self.contactTable.isHidden = true
        self.noContactsView.isHidden = true
        self.spinner.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadContacts()
    }
    
    private func loadContacts() {
        self.spinner.isHidden = false
        let url = URL(string: "https://5ff85fad10778b0017043359.mockapi.io/api/contatos")
        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                DispatchQueue.main.async {
                    self.noContactsView.isHidden = false
                    self.contactTable.isHidden = true
                }
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if(response.statusCode == 200) {
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        let jsonData = Data(dataString.utf8)

                        do {
                            self.contacts = try! JSONDecoder().decode([Contact].self, from: jsonData)
                            if(self.contacts.count == 0) {
                                DispatchQueue.main.async {
                                    self.noContactsView.isHidden = false
                                    self.contactTable.isHidden = true
                                }
                                
                            }else {
                                DispatchQueue.main.async {
                                    self.noContactsView.isHidden = true
                                    self.contactTable.isHidden = false
                                }
                            }
                            DispatchQueue.main.async {
                                self.spinner.isHidden = true
                                self.contactTable.reloadData()
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }else {
                    DispatchQueue.main.async {
                        self.noContactsView.isHidden = false
                        self.contactTable.isHidden = true
                        self.spinner.isHidden = true
                    }
                }
            }
        }
        task.resume()
        
    }
}

