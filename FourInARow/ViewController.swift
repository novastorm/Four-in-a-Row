//
//  ViewController.swift
//  FourInARow
//
//  Created by Adland Lee on 8/15/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK:- Properties
    
    @IBOutlet weak var player1Marker: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player1Input: UITextField!
    @IBOutlet weak var player1PlayButton: UIButton!
    
    @IBOutlet weak var player2Marker: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player2Input: UITextField!
    @IBOutlet weak var player2PlayButton: UIButton!
    
    // MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- Actions
    
    
    func submitPlay(_ column: Int) {
//        let currentPlayer
        // TODO: check for valid play col
        // TODO: check for col between 1 and 7
        guard let entryColText = player1Input?.text else {
            // alert entry error
            return
        }
        
        let entryCol = Int(entryColText)
        
        print("\(player1Label.text) \(entryCol)")
//        gameEngineInstance.placeGamePiece(playerPlay)
    }
}

