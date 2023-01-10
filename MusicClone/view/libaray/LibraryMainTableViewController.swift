//
//  LibraryMainTableViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/07.
//

import UIKit

class LibraryMainTableViewController: UIViewController {
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
        
        
        
    }
}

extension LibraryMainTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortTypeList.filter{$0.isShow!}.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sort", for: indexPath)
        switch indexPath.section {
            case 0:
                let sort = self.sortTypeList.filter{$0.isShow!}
                cell.imageView?.image = UIImage(systemName: sort[indexPath.row].image!)
                cell.textLabel?.text = sortTypeList[indexPath.row].name
                cell.textLabel?.font = .preferredFont(forTextStyle: .body)
                cell.accessoryType = .disclosureIndicator
            default:
                break
        }

        // Configure the cell...

        return cell
    }
    
    // MARK: - Table view data source
    
    
}
