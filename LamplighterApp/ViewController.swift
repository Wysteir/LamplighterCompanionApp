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
    var releaseCounter:Int = 0;
    let releaseCountMax:Int = 100;
    var isHolding:Bool = false;
    private var lastSwipeBeginningPoint: CGPoint?
    
    //let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let timer = Timer(timeInterval: 0.1, target: self, selector: #selector(gestureTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .commonModes)
        
        let doubleTapRec = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(gesture:)))
        doubleTapRec.numberOfTapsRequired = 2;
        self.view.addGestureRecognizer(doubleTapRec)
        
        let tapRec = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
        tapRec.numberOfTapsRequired = 1;
        //tapRec.require(toFail: doubleTapRec)
        self.view.addGestureRecognizer(tapRec)
        
        let longPressRec = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gesture:)))
        self.view.addGestureRecognizer(longPressRec)
        
        let panRec = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        self.view.addGestureRecognizer(panRec)
        
        print("Initialized")
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer is UIPanGestureRecognizer || gestureRecognizer is UILongPressGestureRecognizer) {
            return true
        } else {
            return false
        }
    }
    
    @objc func gestureTimer() {
        //print("Timer fired!")
        if(isHolding){
            if(releaseCounter != 0){
                print("Released For: ")
                print(releaseCounter)
                releaseCounter=0
            }//end if release counter
            holdingCounter+=1;
        }//end if isholding
        else{
            if(holdingCounter != 0){
                print("Held For: ")
                print(holdingCounter)
                holdingCounter = 0
            }//end if holding counter
            if(releaseCounter<releaseCountMax){
                releaseCounter+=1
            }//end if releaseCounter
        }//end else isHolding
    }//end firetimer

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer) -> Void {
        
        if gesture.state == .ended {
            // handling code
            print("Tap")
        }//end if
    }//end handle tap
    
    @objc func handleDoubleTap(gesture: UITapGestureRecognizer) -> Void {
        
        if gesture.state == .ended {
            // handling code
            print("DoubleTap")
        }//end if
    }//end handle tap
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) -> Void {
        
        if gesture.state == .began {
            print("Swipe Begin")
            isHolding = true;
            lastSwipeBeginningPoint = gesture.location(in: gesture.view)
        }
        else if gesture.state == .ended {
            print("Swipe End")
            guard let beginPoint = lastSwipeBeginningPoint else {
                return
            }
            isHolding = false;
            let endPoint = gesture.location(in: gesture.view)
            print("Swipe Co-ords: ")
            print(endPoint.x - beginPoint.x)
            print(endPoint.y - beginPoint.y)
        }//end else if
        
    }//end handle gesture
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) -> Void{
        
        if(gesture.state == .began){
            print("LongPress Begin")
            isHolding = true;
        }
        else if(gesture.state == .ended){
            print("LongPress End")
            isHolding = false;
        }
        
    }


}

