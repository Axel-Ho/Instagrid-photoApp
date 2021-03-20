//
//  viewPlacementOne.swift
//  Instagrid
//
//  Created by Hoberdon Axel on 23/02/2021.
//

import UIKit

class viewPlacementOne: UIView {

    @IBOutlet private var view1 : UIView!
    
    enum Style {
        case on, off
    }
    
     
    var style: Style = .on {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style : Style){
        switch style {
        case .on:
            view1.isHidden = true
            print("ok activé")
        case .off:
            view1.isHidden = true
            print("Négatif")
        }
    }
    

}
