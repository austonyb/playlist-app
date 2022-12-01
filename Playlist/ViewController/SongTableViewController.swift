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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load song array from persistence store into initialized song array.
        SongController.shared.loadFromPersistenceStore()
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let songTitle = mySongTitleTextField.text,
              let artistName = artistNameTextField.text,
              !songTitle.isEmpty,
              !artistName.isEmpty else { return }
        SongController.shared.createSong(title: songTitle, artistName: artistName)
        mySongTitleTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return SongController.shared.songs.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        let song = SongController.shared.songs[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artistName
        
        return cell
    }
    

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let songToDelete = SongController.shared.songs[indexPath.row]
            // Delete the row from the data source
            SongController.shared.deleteSong(song: songToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }  
    }

}
