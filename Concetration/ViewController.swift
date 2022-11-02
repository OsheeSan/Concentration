//
//  ViewController.swift
//  Concetration
//
//  Created by admin on 31.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchedCard(_ sender: UIButton) {
        flipCard(withEmoji: "🙈", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button:UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal )
            button.backgroundColor = .white
        }
     }
}

