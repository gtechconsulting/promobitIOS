//
//  SuccessViewController.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 21/01/21.
//

import Foundation

import Foundation
import UIKit

class SuccessViewController: UIViewController {
    
    @IBOutlet weak var voltarBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        voltarBtn.addTarget(self, action: #selector(btnVoltarClicked), for: .touchUpInside)
        
        
    }
    
    @objc func btnVoltarClicked() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
