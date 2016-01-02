//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Nguyen on 2015-12-25.
//  Copyright © 2015 Alex Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1 = 0, 2 = X
    var activePlayer = 1
    //No buttons tapped
    var gameState = [0,0,0,0,0,0,0,0,0]
    //Determine if there is a tie game
    var tieGame = false
    //There are only 8 possible winning combinations:
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[1,4,7],[0,3,6],[2,5,8],[0,4,8],[2,4,6]]
    
    //Button outlet
    @IBOutlet weak var button: UIButton!

    //Button press function
    @IBAction func buttonPressed(sender: AnyObject) {
        
        //If the position is empty, run the code.
        if gameState[sender.tag] == 0{
            //Fill game matrix with player
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
                //If active player == 1, then set image to nought
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                //Change current player
                activePlayer = 2;
            } else {
                //Else, set image to cross
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                //Change current player
                activePlayer = 1;
                }
            }
        
            for combinations in winningCombinations {
                if (gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]]){
                    //Check to see if nought has won the game
                    if gameState[combinations[0]] == 1 {
                        //Print nought is the winner and prompt to play again
                        let alertController = UIAlertController(title: "WINNER!", message: "Nought has won!", preferredStyle: UIAlertControllerStyle.Alert)
                    
                        let playAgain = UIAlertAction(title: "Play again", style: UIAlertActionStyle.Default) { action -> Void in
                            self.newGame()
                        }
                    
                        alertController.addAction(playAgain)
                        self.presentViewController(alertController, animated: true, completion: nil)
                }else {
                    //else, print that cross has wont and prompt new game
                    let alertController = UIAlertController(title: "WINNER!", message: "Cross has won!", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    let playAgain = UIAlertAction(title: "Play again", style: UIAlertActionStyle.Default) { action -> Void in
                        self.newGame()
                    }
                    alertController.addAction(playAgain)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
        }
        //No winning combination
        tieGame = true; //Assume there is a tie game
        
        //Go through each game state
        for buttonState in gameState {
            if buttonState == 0 {
                //If there is a 0, that means game has not ended
                tieGame =  false
            }
        }
        
        //If there is a tie game, print message and prompt play again
        if tieGame {
            let alertController = UIAlertController(title: "TIE GAME!", message: "You both are very good, play again?", preferredStyle: UIAlertControllerStyle.Alert)
            
            let playAgain = UIAlertAction(title: "Play again", style: UIAlertActionStyle.Default) { action -> Void in
                self.newGame()
            }
            alertController.addAction(playAgain)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    //Create new game functin
    func newGame(){
        //Set the game state to 0
        gameState = [0,0,0,0,0,0,0,0,0]
        //Set default active player to nought
        activePlayer = 1;
        
        //Create a button variables
        var buttonToClear : UIButton
        
        //Clear all buttons
        for var i = 0; i < 9; i++ {
            buttonToClear = view.viewWithTag(i) as! UIButton //Select button via tag
            buttonToClear.setImage(nil, forState: .Normal) //Set image to nil
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

