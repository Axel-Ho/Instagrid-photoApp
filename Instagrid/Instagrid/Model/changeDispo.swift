//
//  changeDispo.swift
//  Instagrid
//
//  Created by Hoberdon Axel on 19/02/2021.
//

import Foundation

class Dispo{
    
    enum State {
        case dispo1 , dispo2, dispo3
    }
    
    func dispoStandart (){
        // Notification mode de communication aveugle entre le modèle et le controlleur
        let name = Notification.Name(rawValue: "disposition standart")
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
        
    }
    
}
