//
//  TGSettingsRequest.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

import ObjectMapper


class TGSettingsRequest: Mappable {
 
    // MARK: - Properties
    
    public var id: Int?
    public var phoneNumber: String?
    public var groups: [TGRow]?
    public var channels: [TGRow]?
    public var bots: [TGRow]?
    
    
    // MARK: Mappable
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        id <- map["id"]
        phoneNumber <- map["phoneNumber"]
    }
}


// MARK: - Helpers

extension TGSettingsRequest {
    
    public var isEmpty: Bool {
        return bots?.isEmpty == true && channels?.isEmpty == true && groups?.isEmpty == true
    }
}
