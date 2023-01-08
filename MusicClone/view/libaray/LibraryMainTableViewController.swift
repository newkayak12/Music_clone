//
//  LibraryMainTableViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/07.
//

import UIKit

class LibraryMainTableViewController: UITableViewController {
    var isEdit: Bool = false
    var sortTypeList: [SortType] = []
    var albumList: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let preset = UserDefaults.standard.value(forKey: "librarySection") as? Data else {return}
        let decoder = JSONDecoder()
        if let decodedData = try? decoder.decode([SortType].self, from: preset) {
            sortTypeList = decodedData
//            print(decodedData)
        }
        
        let miniPlayer = MiniPlayer()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        var count = 0;
        if sortTypeList.count > 0  {count += 1;}
        if albumList.count > 0 {count+=1}
        return count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
            case 0:
                return sortTypeList.filter{$0.isShow!}.count
            case 1:
                return albumList.count
            default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch indexPath.section {
            case 0:
                let sort = self.sortTypeList.filter{$0.isShow!}
                cell.imageView?.image = UIImage(systemName: sort[indexPath.row].image!)
                cell.textLabel?.text = sortTypeList[indexPath.row].name
                cell.accessoryType = .disclosureIndicator
            default:
                break
        }
            
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
