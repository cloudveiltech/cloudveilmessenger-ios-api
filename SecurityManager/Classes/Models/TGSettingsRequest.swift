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
    
    var id: Int?
    var phoneNumber: String?
    var groups: [TGRow]?
    var channels: [TGRow]?
    var bots: [TGRow]?
    
    
    // MARK: Mappable
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        id <- map["id"]
        phoneNumber <- map["phoneNumber"]
    }
}


// MARK: - Helpers

extension TGSettingsRequest {
    
    var isEmpty: Bool {
        return bots?.isEmpty == true && channels?.isEmpty == true && groups?.isEmpty == true
    }
}
