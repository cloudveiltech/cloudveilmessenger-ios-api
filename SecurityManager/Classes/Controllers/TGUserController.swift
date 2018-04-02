//
//  TGUserController.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

@objc open class TGUserController: NSObject {
    
    // MARK: - Singleton
    
    @objc open static let shared = TGUserController()
    
    
    // MARK: - Actions
    
    @objc open func set(userID id: NSInteger) {
        TGUserModel.set(userID: id)
    }
    
    @objc open func set(userPhoneNumber phone: NSString) {
        TGUserModel.set(userPhoneNumber: phone)
    }
    
    @objc open func set(userName name: NSString) {
        TGUserModel.set(userName: name)
    }
    
    @objc open func getUserID() -> NSInteger {
        return TGUserModel.id
    }
    
    @objc open func getUserPhoneNumber() -> NSString {
        return TGUserModel.phoneNumber
    }
    
    @objc open func getUserName() -> NSString {
        return TGUserModel.userName
    }
}
