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
    
    
    // MARK: - Properties
    
    private var settings: TGSettingsResponse? {
        return DataSource<TGSettingsResponse>.value()
    }
    
    @objc public var disableBio: Bool {
        return settings?.disableBio ?? false
    }
    @objc public var disableBioChange: Bool {
        return settings?.disableBioChange ?? false
    }
    @objc public var disableProfilePhoto: Bool {
        return settings?.disableProfilePhoto ?? false
    }
    @objc public var disableProfilePhotoChange: Bool {
        return settings?.disableProfilePhotoChange ?? false
    }

    
    // MARK: - Actions
    
    @objc open func getSettings() {
        
        let request = TGSettingsRequest(JSON: [:])!
        request.id = TGUserController.shared.getUserID()
        request.userName = TGUserController.shared.getUserName() as String
        request.phoneNumber = TGUserController.shared.getUserPhoneNumber() as String
        
        SecurityManager.shared.getSettings(withRequest: request) { (resp) in
            
            self.saveSettings(resp)
        }
    }
    
    private func saveSettings(_ settings: TGSettingsResponse?) {
        
        DataSource<TGSettingsResponse>.set(settings)
    }
}
