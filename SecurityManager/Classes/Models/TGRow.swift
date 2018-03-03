//
//  TGRow.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

import ObjectMapper

class TGRow {
    
    // MARK: - Properties
    
    var id: Int?
    var title: String?
    
    
    // MARK: Mappable
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        id <- map["id"]
        title <- map["title"]
    }
}
