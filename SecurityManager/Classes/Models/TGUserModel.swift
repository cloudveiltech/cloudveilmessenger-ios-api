//
//  TGUserModel.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

class TGUserModel {
    
    // MARK: - Constants
    
    private static let kTGUserModelId = "TGUserModelId"
    private static let kTGUserModelPhoneNumber = "TGUserModelPhoneNumber"
    
    
    // MARK: - Properties
    
    static private(set) var id: Int? {
        set {
            if let id = newValue {
                UserDefaults.standard.set(id, forKey: kTGUserModelId)
            }
        }
        
        get { return UserDefaults.standard.integer(forKey: kTGUserModelId) }
    }
    
    static private(set) var phoneNumber: String? {
        
        set { UserDefaults.standard.set(newValue, forKey: kTGUserModelPhoneNumber) }
        get { return UserDefaults.standard.object(forKey: kTGUserModelPhoneNumber) as? String }
    }
    
    
    // MARK: - Actions
    
    static func set(userID: Int?) {
        id = userID
    }
    
    static func set(userPhoneNumber phone: String?) {
        phoneNumber = phone
    }
}
