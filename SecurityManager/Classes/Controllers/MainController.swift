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
    
    @objc open func getSettings(groups: [TGRow] = [], bots: [TGRow] = [], channels: [TGRow] = []) {
        
        let request = TGSettingsRequest(JSON: [:])!
        request.id = TGUserController.shared.getUserID()
        request.userName = TGUserController.shared.getUserName() as String
        request.phoneNumber = TGUserController.shared.getUserPhoneNumber() as String
        request.groups = groups
        request.bots = bots
        request.channels = channels
        
        SecurityManager.shared.getSettings(withRequest: request) { (resp) in
            
            self.saveSettings(resp)
        }
    }
    
    private func saveSettings(_ settings: TGSettingsResponse?) {
        
        DataSource<TGSettingsResponse>.set(settings)
    }
    
    @objc open func isGroupAvailable(groupID: NSInteger) -> Bool {
        
        if let dictArray = settings?.access?.groups {
            if let index = dictArray.flatMap({ $0.keys }).index(where: { $0 == "\(groupID)" }) {
                return dictArray[index]["\(groupID)"] ?? false
            }
        }
        
        return true
    }
    
    @objc open func isChannelAvailable(channelID: NSInteger) -> Bool {
        
        if let dictArray = settings?.access?.channels {
            if let index = dictArray.flatMap({ $0.keys }).index(where: { $0 == "\(channelID)" }) {
                return dictArray[index]["\(channelID)"] ?? false
            }
        }
        
        return true
    }
    
    @objc open func isBotAvailable(botID: NSInteger) -> Bool {
        
        if let dictArray = settings?.access?.bots {
            if let index = dictArray.flatMap({ $0.keys }).index(where: { $0 == "\(botID)" }) {
                return dictArray[index]["\(botID)"] ?? false
            }
        }
        
        return true
    }
}
