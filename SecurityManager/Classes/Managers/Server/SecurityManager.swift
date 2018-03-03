//
//  SecurityManager.swift
//  SecurityManager
//
//  Created by DimaVirych on 03.03.18.
//  Copyright © 2018 Requestum. All rights reserved.
//

import UIKit

import ObjectMapper

class SecurityManager: ObjectManager {

    // MARK: - Singleton
    
    static let manager = SecurityManager()
    
    
    // MARK: - Actions
    
    func getSettings(withRequest tgRequest: TGSettingsRequest, completion: @escaping (TGSettingsResponse) -> ()) {
        
    
        request(.post, serverConstant: .settings, parameters: tgRequest.toJSON()).responseJSON { (response) in
            
            
        }
    }
}
