//
//  TGUserController.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

class TGUserController {
    
    // MARK: - Singleton
    
    static let `default` = TGUserController()
    
    
    // MARK: - Actions
    
    func set(userID id: Int?) {
        TGUserModel.set(userID: id)
    }
    
    func set(userPhoneNumber phone: String?) {
        TGUserModel.set(userPhoneNumber: phone)
    }
    
    func getUserID() -> Int? {
        return TGUserModel.id
    }
    
    func getUserPhoneNumber() -> String? {
        return TGUserModel.phoneNumber
    }
}
