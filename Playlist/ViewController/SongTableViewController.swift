//
//  SongTableViewController.swift
//  Playlist
//
//  Created by Auston Youngblood on 11/30/22.
//

import UIKit

class SongTableViewController: UITableViewController {

    
    @IBOutlet weak var mySongTitleTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    //MARK: - Properties
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let songTitle = mySongTitleTextField.text,
              let artistName = artistNameTextField.text,
              !songTitle.isEmpty,
              !artistName.isEmpty,
              let playlist = playlist else { return }
        
        SongController.createSong(title: songTitle, artistName: artistName, playlist: playlist)

        mySongTitleTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return playlist?.songs.count ?? 0
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        guard let playlist = playlist else { return cell }
        
        let song = playlist.songs[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artistName
        
        return cell
    }
    

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else { return }
            let songToDelete = playlist.songs[indexPath.row]
            
            // Delete the row from the data source
            SongController.deleteSong(song: songToDelete, playlist: playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }  
    }

}
