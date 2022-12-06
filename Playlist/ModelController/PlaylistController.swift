//
//  PlaylistController.swift
//  Playlist
//
//  Created by Auston Youngblood on 12/5/22.
//

import Foundation

class PlaylistController {
    //MARK: - Shared Instance
    static let shared = PlaylistController()
    
    //SOT
    var playlists: [Playlist] = []
    
    //CRUD
    //Create
    func createPlaylist(name: String) {
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
        saveToPersistenceStore()
    }
    
    //Delete Playlist
    func deletePlaylist(playlist: Playlist) {
        guard let index = playlists.firstIndex(of: playlist) else { return }
        playlists.remove(at: index)
        saveToPersistenceStore()
    }
    
    // Persistence Store
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Playlist.json")
        return fileURL
    }
    
    // Save data to device
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(playlists)
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
            playlists = try JSONDecoder().decode([Playlist].self, from: data)
            
        } catch {
            print("We had an error loading our data from the persistenceStore. \(error.localizedDescription) || \(error)")
        }
    }
    
    
}
