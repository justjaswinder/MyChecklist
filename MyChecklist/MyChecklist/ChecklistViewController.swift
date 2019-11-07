//
//  ViewController.swift
//  MyChecklist
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController,clickPerformCell,AddItemViewControllerDelegate {
    
    func addItemViewControllerDidCancel( _ controller: AddNewItemController) {
        navigationController?.popViewController(animated:true)
    }
//    func addItemViewController(_controller: AddNewItemController,didFinishAdding item: CheckListItem) {
//        navigationController?.popViewController(animated:true)
//    }
    
//    @IBAction func addClick(_ sender: Any) {
//
//        let newRowIndex = items.count
//        let item = CheckListItem()
//        item.text = "I am a new row"
//        item.checked = false
//        items.append(item)
//
//        let indexPath = IndexPath(row: newRowIndex, section: 0)
//        let indexPaths = [indexPath]
//        tableView.insertRows(at: indexPaths, with: .automatic)
//    }
    
    func addItemViewController(_ controller: AddNewItemController,didFinishAdding item: CheckListItem) {
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated:true)
      }
      
    
    var items: [CheckListItem]
    
    //    var row0item: CheckListItem
    //    var row1item: CheckListItem
    //    var row2item: CheckListItem
    //    var row3item: CheckListItem
    //    var row4item: CheckListItem
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            
            let controller = segue.destination
                as! AddNewItemController
            controller.delegate = self
        }}
    
    
  
    
    required init?(coder aDecoder: NSCoder) {
        
        items = [CheckListItem]()
        
        let   row0item = CheckListItem()
        row0item.text = "Apple"
        row0item.checked = false
        items.append(row0item)
        let    row1item = CheckListItem()
        row1item.text = "Mango"
        row1item.checked = true
        items.append(row1item)
        let  row2item = CheckListItem()
        row2item.text = "Papaya"
        row2item.checked = true
        items.append(row2item)
        let  row3item = CheckListItem()
        row3item.text = "Blueberry"
        row3item.checked = false
        items.append(row3item)
        let   row4item = CheckListItem()
        row4item.text = "Guava"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
    
    //   var arr : [String] = ["Apple","Mango","Banana","Papaya", "Guava", "Fig", "Avocado", "Cherry", "Blueberry" , "Blackberry", "Date","Peach", "Orange"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1
        
        
        items.remove(at: indexPath.row)
        // 2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem", for: indexPath) as! checklistCell
            
            cell.delegateClickPerform = self
            
            //            let label = cell.viewWithTag(1000) as! UILabel
            
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
            
            let item = items[indexPath.row]
            cell.textLabel!.text = items[indexPath.row].text
            //   configureText(for: cell, with: item)
            configureCheckmark(for: cell, with: item)
            return cell
            
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("index =\(indexPath.row) ")
        let alert = UIAlertController(title: "Clicked Fruit Name", message: items[indexPath.row].text, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
        //        if let cell = tableView.cellForRow(at: indexPath){
        //            cell.accessoryType = .checkmark
        //        }
        
        //        if let cell = tableView.cellForRow(at: indexPath) {
        //            if cell.accessoryType == .none {
        //                cell.accessoryType = .checkmark
        //            } else {
        //                cell.accessoryType = .none
        //            }
        //        }
        //        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //
    //        if let cell = tableView.cellForRow(at: indexPath){
    //            cell.accessoryType = .none
    //        }
    //    }
    
    func configureCheckmark(for cell: UITableViewCell,
                            with item: CheckListItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    
    
    func btn(cell: checklistCell) {
        
        
        if let cell = tableView.indexPath(for: cell) {
            let alert = UIAlertController(title: "WELCOME", message: items[cell.row].text, preferredStyle: .actionSheet)
            
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



