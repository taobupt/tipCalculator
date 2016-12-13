//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Tao Wang on 12/11/16.
//  Copyright © 2016 Tao Wang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults=UserDefaults.standard
        defaultTip.selectedSegmentIndex=defaults.integer(forKey: "TipIndex")
        defaultTip.addTarget(self, action: #selector(SettingsViewController.changeIndex), for: .valueChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action
    func changeIndex()
    {
        let defaults=UserDefaults.standard
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "TipIndex")
        defaults.synchronize()
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
