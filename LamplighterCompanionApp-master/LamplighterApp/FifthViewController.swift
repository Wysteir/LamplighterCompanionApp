//
//  FifthViewController.swift
//  LamplighterApp
//
//  Created by Van Osch Benjamin D. on 3/29/19.
//  Copyright © 2019 Van Osch Benjamin D. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBAction func buttonPressGoBack(_ sender: UIButton) {
        willMove(toParentViewController: nil)
        view.removeFromSuperview()
        removeFromParentViewController()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
