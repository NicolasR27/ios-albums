//
//  AlbumsTableViewController.swift
//  IOS -Albums
//
//  Created by Nicolas Rios on 1/14/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        albumController.getAlbums { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumController.albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let album = albumController.albums[indexPath.row]
        
        cell.textLabel?.text = album.name
        cell.detailTextLabel?.text = album.artist

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue" {
            
            guard let destinationVC = segue.destination as? AlbumDetailViewController else { return }
            
            destinationVC.albumController = albumController
            
        } else if segue.identifier == "DetailSegue" {
            guard let destinationVC = segue.destination as? AlbumDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let album = albumController.albums[indexPath.row]
            
            destinationVC.album = album
            destinationVC.albumController = albumController
        }
    }
    
    let albumController = AlbumController()
    
}
