//
//  CustomTextField.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 21/01/21.
//

//
//  FloatingLabelInput.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 21/01/21.
//

import Foundation
import UIKit

class CustomTextField: UITextField {

    private let defaultUnderlineColor = UIColor.lightGray
        private let bottomLine = UIView()

        override func awakeFromNib() {
            super.awakeFromNib()

            borderStyle = .none
            bottomLine.translatesAutoresizingMaskIntoConstraints = false
            bottomLine.backgroundColor = defaultUnderlineColor

            self.addSubview(bottomLine)
            bottomLine.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 1).isActive = true
            bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }

        public func setUnderlineColor(color: UIColor = .red) {
            bottomLine.backgroundColor = color
        }

        public func setDefaultUnderlineColor() {
            bottomLine.backgroundColor = defaultUnderlineColor
        }
}

