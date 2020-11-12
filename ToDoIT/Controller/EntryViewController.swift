//
//  EntryViewController.swift
//  ToDoIT
//
//  Created by Laura Garcia on 12/11/2020.
//

import RealmSwift
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    private let realm = try! Realm()
    public var completitionHandler: (() -> Void)?
    
    //MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        textField.delegate = self
        datePicker.setDate(Date(), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - SaveButton
    
    @IBAction @objc func didTapSaveButton() {
        let text = textField.text
        if text == textField.text && !text!.isEmpty {
            let date = datePicker.date
            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.date = date
            newItem.item = text!
            realm.add(newItem)
            try! realm.commitWrite()
            completitionHandler?()
            performSegue(withIdentifier: "ToDosView", sender: Any?.self)
        }
        else {
           print("oof")
        }
    }
}

