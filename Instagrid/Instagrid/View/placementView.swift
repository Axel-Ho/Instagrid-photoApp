//
//  placementView.swift
//  Instagrid
//
//  Created by Hoberdon Axel on 23/02/2021.
//

import UIKit

class placementView: UIView {

    // MARK: - @IBOutlet

    @IBOutlet weak var buttonPlacementOne: UIButton!
    @IBOutlet weak var buttonPlacementTwo: UIButton!
    @IBOutlet weak var buttonPlacementThree: UIButton!
    
    @IBOutlet weak var viewPlacementOne: UIView!
    @IBOutlet weak var viewPlacementTwo: UIView!
    @IBOutlet weak var viewPlacementThree: UIView!

    
// MARK: - Function that manage the disposition of the images

    public func startDispo1 () {
        viewPlacementOne.isHidden = false
        viewPlacementTwo.isHidden = true
        viewPlacementThree.isHidden = true
        
        buttonPlacementOne.isSelected = true
        buttonPlacementTwo.isSelected = false
        buttonPlacementThree.isSelected = false
        
        if buttonPlacementOne.isSelected == true {
            buttonPlacementOne.setBackgroundImage(UIImage(named: "Selected.png"), for: .selected)
        }
    }
    
    public func startDispo2 () {
        viewPlacementOne.isHidden = true
        viewPlacementTwo.isHidden = false
        viewPlacementThree.isHidden = true
        
        buttonPlacementOne.isSelected = false
        buttonPlacementTwo.isSelected = true
        buttonPlacementThree.isSelected = false
        
        if buttonPlacementTwo.isSelected == true {
            buttonPlacementTwo.setBackgroundImage(UIImage(named: "Selected.png"), for: .selected)
        }
    }
    
    public func startDispo3 () {
        viewPlacementOne.isHidden = true
        viewPlacementTwo.isHidden = true
        viewPlacementThree.isHidden = false
        
        buttonPlacementOne.isSelected = false
        buttonPlacementTwo.isSelected = false
        buttonPlacementThree.isSelected = true
        
        if buttonPlacementThree.isSelected == true {
            buttonPlacementThree.setBackgroundImage(UIImage(named: "Selected.png"), for: .selected)
        }
    }
    

}
