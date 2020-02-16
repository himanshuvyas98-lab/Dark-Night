//
//  ViewController.swift
//  zeroCross
//
//  Created by admin on 20/06/19.
//  Copyright © 2019 professional. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1  //batman
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameIsActive = true
    
    
    
    
    
    @IBOutlet weak var wonLabel: UILabel!
    
    @IBAction func action(_ sender: Any) {
        
        
        
        
        
        
        if (gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true) {
            
            gameState[(sender as AnyObject).tag-1] = activePlayer
            
            if (activePlayer == 1) {
                
                (sender as AnyObject).setImage(UIImage(named: "batmanToy.jpg"), for: UIControl.State())
                activePlayer = 2
            } else {
                (sender as AnyObject).setImage(UIImage(named: "jokerToy.jpg"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    
                    wonLabel.text = "Batman has Won!!"
                } else {
                    wonLabel.text = "Joker has Won!!"
                    
                }
                
                playAgainButton.isHidden = false
                wonLabel.isHidden = false
                
            }
        }
        gameIsActive = false
        
        for i  in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
            
        }
        
        if gameIsActive == false {
            wonLabel.text = "It was a Draw!!"
            wonLabel.isHidden = false
            playAgainButton.isHidden = false
        }
        
    }
    

    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
    
        
       gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        wonLabel.isHidden = true
        
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

