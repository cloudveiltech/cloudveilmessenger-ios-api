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
    
    private var observers: [() -> ()] = []
    private let kWasFirstLoaded = "wasFirstLoaded"
    private var wasFirstLoaded: Bool {
        get { return UserDefaults.standard.bool(forKey: kWasFirstLoaded) }
        set { UserDefaults.standard.set(newValue, forKey: kWasFirstLoaded) }
    }
    
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
    @objc public var isSecretChatAvailable: Bool {
        return settings?.secretChat ?? false
    }
    @objc public var minimumSecretLenght: NSInteger {
        
        if let lenghtStr = settings?.secretChatMinimumLength {
            return Int(lenghtStr) ?? -1
        }
        
        return -1
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
        for observer in observers {
            observer()
        }
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
    
    @objc open func firstRunPopup(at viewController: UIViewController) {
        
        if !wasFirstLoaded {
            wasFirstLoaded = true
            
            let alert = UIAlertController(title: "CloudVeil!", message: "CloudVeil Messenger uses a server based system to control access to Bots, Channels, and Groups and other policy rules. This is used to block unacceptable content. Your Telegram id and list of channels, bots, and groups will be sent to our system to allow this to work. We do not have access to your messages themselves.", preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .default, handler: nil))
            
            viewController.present(alert, animated: true)
        }
    }
    
    @objc open func appendObserver(obs: @escaping () -> ()) {
        observers.append(obs)
    }
}
