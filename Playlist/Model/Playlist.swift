//
//  Playlist.swift
//  Playlist
//
//  Created by Auston Youngblood on 12/5/22.
//

import Foundation

class Playlist: Codable {
    let name: String
    var songs: [Song]
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
}

extension Playlist: Equatable {
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.name == rhs.name && lhs.songs == rhs.songs
    }
    
    
}
