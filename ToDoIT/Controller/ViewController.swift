//
//  ViewController.swift
//  ToDoIT
//
//  Created by Laura Garcia on 10/11/2020.
//

import RealmSwift
import UIKit

    //MARK: - ToDoListItemClass

class ToDoListItem: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    //MARK: - Properties
    
    @IBOutlet var table: UITableView!
    private var data = [ToDoListItem]()
    private let realm = try! Realm()
    
    //MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = realm.objects(ToDoListItem.self).map({ $0 })
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
    }
    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //something
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row].item
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = data[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(identifier: "view") as? DetailViewController else {return}
        vc.item = item
        vc.delitionHandler = { [weak self] in self?.refresh()}
        performSegue(withIdentifier: "detail", sender: self)
    }
    //MARK: - TappedAddButton
    
    @IBAction func DidTapAddButton() {
        performSegue(withIdentifier: "newTodoView", sender: Any?.self)
        refresh()
    }
    //MARK: - RefreshingRealm
    
    func refresh() {
        data = realm.objects(ToDoListItem.self).map({ $0 })
        table.reloadData()
    }
}

