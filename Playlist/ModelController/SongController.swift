//
//  SongController.swift
//  Playlist
//
//  Created by Auston Youngblood on 11/30/22.
//

import Foundation

class SongController {
    
    //shared instance
    static let shared = SongController()
    
    //Source of Truth
    var songs: [Song] = []
    
    
    //CRUD:
    
    //Create - where the song controller creates a song
    
    func createSong(title: String, artistName: String) {
        let newSong = Song(title: title, artistName: artistName)
        songs.append(newSong)
        saveToPersistenceStore()
    }
    
    //Read - read data from an external source. Make songs from the data.
    
    //Update - update info about a song.
    
    //Delete - logic to delete a song.
    
    func deleteSong(song: Song) {
        guard let index = songs.firstIndex(of: song) else { return }
        songs.remove(at: index)
        saveToPersistenceStore()
    }
    
    //MARK: - Persistence
    
    // Persistence Store
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Playlist.json")
        return fileURL
    }
    
    // Save data to device
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(songs)
            try data.write(to: persistentStore())
        } catch {
            print("there was an error saving data \(error.localizedDescription)")
        }
    }
    
    // load data from device
    func loadFromPersistenceStore() {
        do {
            //capture data stored in JSON
            let data = try Data(contentsOf: persistentStore())
            
            //decode data into songs
            songs = try JSONDecoder().decode([Song].self, from: data)
            
        } catch {
            print("We had an error loading our data from the persistenceStore. \(error.localizedDescription) || \(error)")
        }
    }
}
