//
//  MainController.swift
//  SecurityManager
//
//  Created by Dmitriy Virych on 3/2/18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import Foundation

import Alamofire

@objc open class MainController: NSObject {
    
    // MARK: - Singleton
    
    @objc open static let shared = MainController()

    
    @objc open func getSettings() {
        
        let request = TGSettingsRequest(JSON: [:])!
        request.id = TGUserController.shared.getUserID()
        request.userName = TGUserController.shared.getUserName() as String
        request.phoneNumber = TGUserController.shared.getUserPhoneNumber() as String
        
        
        SecurityManager.shared.getSettings(withRequest: request) { (resp) in
            
            print(resp?.toJSONString())
        }
    }
    
    @objc open func setUser() {
        
    }
    
    private func setupSettings(_ settings: TGSettingsResponse) {
        
    }
}
