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
    
    var secretChat: Bool?
    var secretChatMinimumLength: Int?
    
    
    // MARK: Mappable
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        secretChat <- map["secretChat"]
        secretChatMinimumLength <- map["secretChatMinimumLength"]
    }
}
