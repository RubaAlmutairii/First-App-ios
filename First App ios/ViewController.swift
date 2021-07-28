//
//  ViewController.swift
//  First App ios
//
//  Created by Ruba Almutairi on 18/12/1442 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var DATA_KEY = "data_Key"
    var pastedStrings : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //save data to persistent storage
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA_KEY) {
            pastedStrings.append(contentsOf: loadedStrings)
        }
        showText()
    }

    func addText(){
        guard let text =  UIPasteboard.general.string, !pastedStrings.contains(text) else {
            return
        }
        pastedStrings.append(text)
        //
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        showText()

    }

    func showText(){
        textView.text = ""
        for str in pastedStrings {
            textView.text.append("\(str)\n\n")
        }
    }
    
    //clear saved data
    @IBAction func trashWasPressed(_ sender: Any) {
        pastedStrings.removeAll()
        textView.text = ""
        UserDefaults.standard.removeObject(forKey:  DATA_KEY)
    }
    
}


