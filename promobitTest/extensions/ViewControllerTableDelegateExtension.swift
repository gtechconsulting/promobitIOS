//
//  ViewControllerTableDelegateExtension.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 20/01/21.
//

import Foundation
import UIKit


extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
