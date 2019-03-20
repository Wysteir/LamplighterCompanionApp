//
//  ViewController.swift
//  LamplighterApp
//
//  Created by Van Osch Benjamin D. on 2/13/19.
//  Copyright © 2019 Van Osch Benjamin D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var holdingCounter:Int = 0;
    var isHolding:Bool = false;
    private var lastSwipeBeginningPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)*/
        
        let panRec = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        self.view.addGestureRecognizer(panRec)
        
        print("Initialized")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) -> Void {
        /*print(gesture.direction.rawValue)
        
        switch gesture.direction.rawValue {
        case 1:
            print("This is going right")
        case 2:
            print("This is going left")
        case 4:
            print("This is going up")
        case 8:
            print("This is going down")
        default:
            print("Default Case")
        }//end switch*/
        
        if gesture.state == .began {
            //print("Begin")
            
            lastSwipeBeginningPoint = gesture.location(in: gesture.view)
        }//end if
        else if gesture.state == .ended {
            //print("End")
            guard let beginPoint = lastSwipeBeginningPoint else {
                return
            }
            let endPoint = gesture.location(in: gesture.view)
            print("Point: ")
            print(endPoint.x - beginPoint.x)
            print(endPoint.y - beginPoint.y)
        }//end else if
        
    }//end handle gesture


}

