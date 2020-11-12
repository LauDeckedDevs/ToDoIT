//
//  DetailViewController.swift
//  ToDoIT
//
//  Created by Laura Garcia on 12/11/2020.
//

import RealmSwift
import UIKit

class DetailViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemDate: UILabel!
    public var item: ToDoListItem?
    public var delitionHandler: (() -> Void)?
    static let dateFormater: DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        return dateFormater
    }()
    private let realm = try! Realm()

    //MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemName.text = item?.item
        itemDate.text = Self.dateFormater.string(from: item!.date)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
    }
    
    //MARK: - TappedDeleteItems
    
    @objc private func didTapDelete() {
        guard let myItem = self.item else {return}
        realm.beginWrite()
        realm.delete(myItem)
        try! realm.commitWrite()
        delitionHandler?()
        performSegue(withIdentifier: "return", sender: self)
    }
}
