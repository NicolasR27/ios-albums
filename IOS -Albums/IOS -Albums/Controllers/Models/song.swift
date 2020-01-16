//
//  song.swift
//  IOS -Albums
//
//  Created by Nicolas Rios on 1/14/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

import Foundation


struct Song: Codable {
    let duration: String
    let id: String
    let name: String
    
    enum SongKeys: String, CodingKey {
        case duration
        case id
        case name
        
        enum DurationKeys: String, CodingKey {
            case duration
        }
        
        enum NameKeys: String, CodingKey {
            case title
        }
    }
}
