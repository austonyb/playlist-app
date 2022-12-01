//
//  Song.swift
//  Playlist
//
//  Created by Auston Youngblood on 11/30/22.
//

import Foundation

class Song: Codable {
    let title: String
    let artistName: String
    
    init(title: String, artistName: String) {
        self.title = title
        self.artistName = artistName
    }
}

extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.title == rhs.title && lhs.artistName == rhs.artistName
    }
}
