//
//  ViewController.swift
//  ToDoIt
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

