//
//  TGRow.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

import ObjectMapper

public class TGRow {
    
    // MARK: - Properties
    
    public var id: Int?
    public var title: String?
    public var userName: String?
    
    
    // MARK: Mappable
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        id <- map["id"]
        title <- map["title"]
        userName <- map["user_name"]
    }
}
