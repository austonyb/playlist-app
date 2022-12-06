//
//  SongController.swift
//  Playlist
//
//  Created by Auston Youngblood on 11/30/22.
//

import Foundation

class SongController {
    
    //CRUD:
    
    //Create - where the song controller creates a song
    
    static func createSong(title: String, artistName: String, playlist: Playlist) {
        let newSong = Song(title: title, artistName: artistName)
        playlist.songs.append(newSong)
        PlaylistController.shared.saveToPersistenceStore()
    }
    
    //Delete - logic to delete a song.
    
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistenceStore()
    }
}


