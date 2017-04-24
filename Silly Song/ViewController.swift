//
//  ViewController.swift
//  Silly Song
//
//  Created by Niral Pokal on 3/22/17.
//  Copyright © 2017 Niral Pokal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
         nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func reset(sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(sender: Any) {
        if nameField.text != "" {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: (nameField.text!))
        }
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}



func shortNameFromName(name: String) -> String {
    let lowercasedName = name.lowercased()
    let vowels = CharacterSet(charactersIn: "aeiou")
    let range = lowercasedName.rangeOfCharacter(from: vowels)
    if (range != nil) {
        return lowercasedName.substring(from: (range!.lowerBound))
    } else {
        return lowercasedName
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let fullName = fullName.trimmingCharacters(in: .whitespacesAndNewlines)
    let shortName = shortNameFromName(name: fullName)
    return lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName.capitalized)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
}
