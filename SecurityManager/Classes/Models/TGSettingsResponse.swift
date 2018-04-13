//
//  TGSettingsResponse.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

import ObjectMapper

class TGSettingsResponse: Mappable {
    
    // MARK: - Properties
    
    public var secretChat: Bool?
    public var secretChatMinimumLength: String?
    public var groups: [Int]?
    public var bots: [Int]?
    public var channels: [Int]?
    public var disableBio: Bool?
    public var disableBioChange: Bool?
    public var disableProfilePhoto: Bool?
    public var disableProfilePhotoChange: Bool?
    public var access: AccessObject?
    
    
    // MARK: Mappable
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        secretChat <- map["secret_chat"]
        secretChatMinimumLength <- map["secret_chat_minimum_length"]
        groups <- map["groups"]
        bots <- map["bots"]
        channels <- map["channels"]
        disableBio <- map["disable_bio"]
        disableBioChange <- map["disable_bio_change"]
        disableProfilePhoto <- map["disable_profile_photo"]
        disableProfilePhotoChange <- map["disable_profile_photo_change"]
        access <- map["access"]
    }
}


class AccessObject: Mappable {
    
    // MARK: - Properties
    
    public var groups: [[String: Bool]]?
    public var bots: [[String: Bool]]?
    public var channels: [[String: Bool]]?
    public var stickers: [[String: Bool]]?
    public var users: [[String: Bool]]?
    
    
    // MARK: Mappable
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        groups <- map["groups"]
        bots <- map["bots"]
        channels <- map["channels"]
        stickers <- map["channels"]
        users <- map["channels"]
    }
}


