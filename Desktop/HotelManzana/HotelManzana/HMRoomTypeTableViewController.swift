//
//  HMRoomTypeTableViewController.swift
//  HotelManzana
//
//  Created by Artur Balabanskyy on 1/2/18.
//  Copyright © 2018 Artur Balabanskyy. All rights reserved.
//

import UIKit

class HMRoomTypeTableViewController: UITableViewController {

    var roomType: HMRoomType?
    var currentRoomSelected: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HMRoomType.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)

        let room = HMRoomType.all[indexPath.row]
        cell.textLabel?.text = room.name
        cell.detailTextLabel?.text = "$ \(room.price)"
        if room == self.roomType {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        roomType = HMRoomType.all[indexPath.row]
        tableView.reloadData()
        
        if indexPath.row == 0 {
            currentRoomSelected = (roomType?.shortName)!
        }
        else if indexPath.row == 1 {
            currentRoomSelected = (roomType?.shortName)!
        }
        else if indexPath.row == 2 {
            currentRoomSelected = (roomType?.shortName)!
        }
        print(currentRoomSelected)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "send" {
//            guard let navC = segue.destination as? UINavigationController else {return}
//            guard let CnavC = navC.topViewController as? HMAddRegistrationTableViewController else {return}
//            CnavC.roomTypeLabel.text = currentRoomSelected
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let room = segue.destination as? HMAddRegistrationTableViewController else {return}
        room.roomTypeLabel.text = currentRoomSelected
    }
    
    @IBAction func saveRoom(segue: UIStoryboardSegue) {
        let roomController = segue.source as! HMAddRegistrationTableViewController
        let name = roomController.roomTypeLabel.text
        roomController.roomTypeLabel.text = name
        
        
    }
}
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


