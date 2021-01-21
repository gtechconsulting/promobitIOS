//
//  ViewControllerTableExtension.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 20/01/21.
//

import Foundation
import UIKit

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell! = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell
        
        cell.contactName.text = contacts[indexPath.row].name
        cell.companyName.text = contacts[indexPath.row].company
        cell.contactImg.layer.borderWidth = 1.0
        cell.contactImg.layer.masksToBounds = false
        cell.contactImg.layer.borderColor = UIColor.white.cgColor
        cell.contactImg.layer.cornerRadius = cell.contactImg.frame.size.width / 2
        cell.contactImg.clipsToBounds = true
        cell.contactImg.downloaded(from: contacts[indexPath.row].avatar!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    
}
