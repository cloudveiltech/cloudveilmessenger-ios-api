//
//  TGUserModel.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

class TGUserModel: NSObject {
    
    // MARK: - Constants
    
    private static let kTGUserModelId = "TGUserModelId"
    private static let kTGUserModelPhoneNumber = "TGUserModelPhoneNumber"
    private static let kTGUserModelUserName = "TGUserModelUserName"
    
    
    // MARK: - Properties
    
    public static private(set) var id: NSInteger {
        
        set { UserDefaults.standard.set(id, forKey: kTGUserModelId) }
        get { return 304115087 }//UserDefaults.standard.integer(forKey: kTGUserModelId) }
    }
    
    public static private(set) var phoneNumber: NSString {
        
        set { UserDefaults.standard.set(newValue, forKey: kTGUserModelPhoneNumber) }
        get { return (UserDefaults.standard.object(forKey: kTGUserModelPhoneNumber) as? NSString ?? "380994502491") }
    }
    
    public static private(set) var userName: NSString {
        
        set { UserDefaults.standard.set(newValue, forKey: kTGUserModelUserName) }
        get { return (UserDefaults.standard.object(forKey: kTGUserModelUserName) as? NSString ?? "damienissa") }
    }
    
    
    // MARK: - Actions
    
    public static func set(userID: NSInteger) {
        id = userID
    }
    
    public static func set(userPhoneNumber phone: NSString) {
        phoneNumber = phone
    }
    
    public static func set(userName name: NSString) {
        userName = name
    }
}
