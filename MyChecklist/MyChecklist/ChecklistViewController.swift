//
//  ViewController.swift
//  MyChecklist
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController,clickPerformCell {
  
    
    
    var arr : [String] = ["Apple","Mango","Banana","Papaya", "Guava", "Fig", "Avocado", "Cherry", "Blueberry" , "Blackberry", "Date","Peach", "Orange"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return arr.count
        
    }
    
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem", for: indexPath) as! checklistCell
            
            cell.delegateClickPerform = self
         
//            let label = cell.viewWithTag(1000) as! UILabel
            cell.textLabel!.text = arr[indexPath.row]
//            if indexPath.row == 0 {
//                cell.textLabel!.text = "Walk the dog"
//            } else if indexPath.row == 1 {
//                cell.textLabel!.text  = "Brush my teeth"
//            } else if indexPath.row == 2 {
//                cell.textLabel!.text  = "Learn iOS development"
//            } else if indexPath.row == 3 {
//                cell.textLabel!.text = "Soccer practice"
//            } else if indexPath.row == 4 {
//                cell.textLabel!.text  = "Eat ice cream"
//            }
            // End of new code block
            return cell
            
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        print("index =\(indexPath.row) ")
        let alert = UIAlertController(title: "Clicked Fruit Name", message: arr[indexPath.row], preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
//        if let cell = tableView.cellForRow(at: indexPath){
//            cell.accessoryType = .checkmark
//        }

        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
       tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//
//        if let cell = tableView.cellForRow(at: indexPath){
//            cell.accessoryType = .none
//        }
//    }
    
    func btn(cell: checklistCell) {
      
        
         if let cell = tableView.indexPath(for: cell) {
            let alert = UIAlertController(title: "WELCOME", message: arr[cell.row], preferredStyle: .actionSheet)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        
        }
        
    }
    
}


protocol clickPerformCell {
    func btn(cell : checklistCell)
}

class checklistCell: UITableViewCell {
    var delegateClickPerform : clickPerformCell?
    @IBAction func btnclick(_ sender: Any) {
        delegateClickPerform?.btn(cell: self)
    }
}



