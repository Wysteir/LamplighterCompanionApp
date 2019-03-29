//
//  ViewController.swift
//  LamplighterApp
//
//  Created by Van Osch Benjamin D. on 2/13/19.
//  Copyright © 2019 Van Osch Benjamin D. All rights reserved.
//

import UIKit

struct Constants{
    static let firstButton = 1;
    static let secondButton = 2;
    static let thirdButton = 3;
    static let fourthButton = 4;
    static let fifthButton = 5;
}

class RootController: UIViewController {
    var firstViewController: FirstViewController?
    var secondViewController: SecondViewController?
    var thirdViewController: ThirdViewController?
    var fourthViewController: FourthViewController?
    var fifthViewController: FifthViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchViews(_ sender: UIButton){
        let tag = sender.tag;
        
        //Create the new view controller, if required.
        if(tag == Constants.firstButton){
            if(firstViewController==nil){
                firstViewController = (self.storyboard?.instantiateViewController(withIdentifier: "First") as! FirstViewController)
            }
        }
        if(tag == Constants.secondButton){
            if(secondViewController==nil){
                secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "Second") as! SecondViewController)
            }
        }
        if(tag == Constants.thirdButton){
            if(thirdViewController==nil){
                thirdViewController = (self.storyboard?.instantiateViewController(withIdentifier: "Third") as! ThirdViewController)
            }
        }
        if(tag == Constants.fourthButton){
            if(fourthViewController==nil){
                fourthViewController = (self.storyboard?.instantiateViewController(withIdentifier: "Fourth") as! FourthViewController)
            }
        }
        if(tag == Constants.fifthButton){
            if(fifthViewController==nil){
                fifthViewController = (self.storyboard?.instantiateViewController(withIdentifier: "Fifth") as! FifthViewController)
            }
        }
        
        //Switch view controllers.
        UIView.beginAnimations("Switch animation from Root to First", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationCurve(.easeOut)
        if(tag==Constants.firstButton){
            firstViewController?.view.frame = view.frame
            switchToViewController(firstViewController)
            switchToViewController(secondViewController)
            //present(UIViewController, animated: true, completion: nil)
        }
        else if(tag==Constants.secondButton){
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController?.view.frame = view.frame
            switchToViewController(secondViewController)
            //present(UIViewController, animated: true, completion: nil)
        }
        else if(tag==Constants.thirdButton){
             UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            thirdViewController?.view.frame = view.frame
            switchToViewController(thirdViewController)
            //present(UIViewController, animated: true, completion: nil)
        }
        else if(tag==Constants.fourthButton){
             UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            fourthViewController?.view.frame = view.frame
            switchToViewController(fourthViewController)
            //present(UIViewController, animated: true, completion: nil)
        }
        else if(tag==Constants.fifthButton){
             UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            fifthViewController?.view.frame = view.frame
            switchToViewController(fifthViewController)
            //present(UIViewController, animated: true, completion: nil)
        }
        UIView.commitAnimations()
    }
    func switchToViewController(_ toVC: UIViewController?){
        if(toVC != nil){
            addChildViewController((toVC)!)
            view.addSubview((toVC?.view)!)
            toVC?.didMove(toParentViewController: self)
        }
    }

}

