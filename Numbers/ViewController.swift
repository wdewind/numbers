//
//  ViewController.swift
//  Numbers
//
//  Created by Will DeWind on 1/16/15.
//  Copyright (c) 2015 Will DeWind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Square1: UIView!
    @IBOutlet weak var Square2: UIView!
    @IBOutlet weak var Square3: UIView!
    @IBOutlet weak var Square4: UIView!
    @IBOutlet weak var SquareBlank: UIView!
    @IBOutlet weak var Square5: UIView!
    @IBOutlet weak var Square6: UIView!
    @IBOutlet weak var Square7: UIView!
    @IBOutlet weak var Square8: UIView!

    var squares: [UIView] = []
    var startSquare: UIView!
    var endSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.squares = [self.Square1, self.Square2, self.Square3, self.Square4, self.SquareBlank, self.Square5, self.Square6, self.Square7, self.Square8]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        var currentState = recognizer.state
        if (currentState == UIGestureRecognizerState.Began || currentState == UIGestureRecognizerState.Ended) {
            var i:Int = 0
            for square in self.squares {
                i++
                var x = recognizer.locationInView(square).x
                var y = recognizer.locationInView(square).y
                var inSquare:Bool = x > 0 && y > 0 && x < 98 && y < 98
                if (inSquare) {
                    if (currentState == UIGestureRecognizerState.Began) {
                        self.startSquare = square
                    } else if (currentState == UIGestureRecognizerState.Ended){
                        self.endSquare = square
                        if (self.endSquare == self.SquareBlank) {
                            var xDistance = (self.startSquare.center.x - self.endSquare.center.x);
                            var yDistance = (self.startSquare.center.y - self.endSquare.center.y);
                            var totalDistance = sqrt(xDistance*xDistance + yDistance*yDistance);
                            if (totalDistance == 101) {
                                var startSquareX = self.startSquare.frame.midX
                                var startSquareY = self.startSquare.frame.midY
                                self.startSquare.center.x = self.endSquare.frame.midX
                                self.startSquare.center.y = self.endSquare.frame.midY
                                self.endSquare.center.x = startSquareX
                                self.endSquare.center.y = startSquareY
                            }
                            
                        }
                    }
                }
            }
            
            
        }
    }


}

