//
//  footer.swift
//  Instagrid
//
//  Created by Hoberdon Axel on 19/02/2021.
//

import UIKit

class footer: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet private var imagedispo1: UIImageView?
    @IBOutlet private var imagedispo2: UIImageView?
    @IBOutlet private var imagedispo3: UIImageView?
    
    enum Style {
        case dispo1, dispo2, dispo3
    }
    
    
    
}
