//
//  ViewController.swift
//  Restaurant Menu
//
//  Created by ashish kumar dhimaan on 25/07/23.
//

import UIKit


class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var lblHeaderName: UILabel!
    @IBOutlet weak var btnArrow: UIButton!
}


class MenuListTableViewCell: UITableViewCell {
    @IBOutlet weak var lblMenuName: UILabel!
}



class ViewController: UIViewController {
    @IBOutlet weak var tableViewMenuList: UITableView!
    
//    var arrMenuList: [MenuListModel] = [MenuListModel]()
//    var arrHeaderList: [MenuHeaderModel] = [MenuHeaderModel]()
    
//    var arrMenuItemData: [MenuModelDTO] = [MenuModelDTO]()
    
    var getDictData = [
        [
            "category": "Staters",
            "category_item": ["Papdi Chaat", "Sweet Corn Chaat", "Paneer Pakora"],
            "isOpen": false],
        
        [
            "category": "Sweets",
            "category_item": ["Jalebi", "Rasgulla.", "Gulab Jamun"],
            "isOpen": false],
        
        [
            "category": "Snacks",
            "category_item": ["Paneer pakoda", "Veg burger", "Frankie recipe"],
            "isOpen": false],
        
        [
            "category": "Rolls",
            "category_item": ["Paneer rolls", "Veg rolls", "egg rolls"],
            "isOpen": false],
        
        [
            "category": "Chines",
            "category_item": ["Spring Rolls", "Manchurians", "Sweet Chili potatoes"],
            "isOpen": false],
        
        [
            "category": "South indian",
            "category_item": ["Ven Pongal", "Lemon Rice", " Boondi raita"],
            "isOpen": false]
        ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMenuList.dataSource = self
        tableViewMenuList.delegate = self
        
//        let cat1 = MenuHeaderModel(category_name: "Staters")
//        let cat2 = MenuHeaderModel(category_name: "Sweets")
//        let cat3 = MenuHeaderModel(category_name: "Snacks ")
//        let cat4 = MenuHeaderModel(category_name: "Rolls")
//        let cat5 = MenuHeaderModel(category_name: "Chines")
//        let cat6 = MenuHeaderModel(category_name: "South indian")
        
        
        /*let item1 = MenuListModel(item_name:  "Paneer tikka" , item_price: "40")
        let item2 = MenuListModel(item_name:  "Chilli paneer" , item_price: "80")
        let item3 = MenuListModel(item_name:  "Paneer tikka" , item_price: "40")
        let item14 = MenuListModel(item_name:  "Paneer tikka" , item_price: "40")
        
        
        let menuObj = MenuModelDTO(item_category_name: cat1, item_under_category: [item1, item1])
        let menuObj2 = MenuModelDTO(item_category_name: cat1, item_under_category: [item1, item1])*/
        
        

//        arrMenuItemData.append(menuObj)
//        arrMenuItemData.append(menuObj2)
        
        
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getDictData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let num = getDictData[section]
        let sectionData = num["category_item"] as! [String]
        
        let isOp = num["isOpen"] as! Bool
        
        if isOp {
            return sectionData.count
        } else {
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMenuList.dequeueReusableCell(withIdentifier: "MenuListTableViewCell", for: indexPath) as! MenuListTableViewCell
        
        let num = getDictData[indexPath.section]
        let sectionData = num["category_item"] as! [String]
        
        cell.lblMenuName.text = sectionData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
        let dict = getDictData
        let dictObj = dict[section]
        cell.lblHeaderName.text = (dictObj["category"] as! String)
        
        cell.btnArrow.tag = section
        cell.btnArrow.addTarget(self, action: #selector(openCell(_: )), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    @objc func openCell(_ sender: UIButton) {
        var num = getDictData[sender.tag]
        let isOp = num["isOpen"] as! Bool
                        
        for i in 0..<getDictData.count {
            getDictData[i]["isOpen"] = false
        }
        
        num["isOpen"] = isOp ? false : true
        var newObj = getDictData[sender.tag]
        newObj["isOpen"] = num["isOpen"]
        
        
        (getDictData[sender.tag]) = newObj
                
        tableViewMenuList.reloadData()
        
    }
    
}
