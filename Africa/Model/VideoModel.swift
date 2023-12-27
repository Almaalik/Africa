//
//  VideoModel.swift
//  Africa
//
//  Created by Abdul Maalik on 05/09/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // COMPUTED PROPERTY
    var thumbnail: String {
        "video-\(id)"
    }
}
