//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tao Wang on 12/4/16.
//  Copyright © 2016 Tao Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: properties
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var TipLable: UILabel!
    
    @IBOutlet weak var TotalLable: UILabel!
    
    @IBOutlet weak var BillView: UIView!
    
    @IBOutlet weak var TipSelect: UISegmentedControl!
    @IBOutlet weak var TotalView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //set title in the navigation Bar
        self.title="Tip Calculator"
        self.TotalView.alpha=0
        self.BillView.alpha=1
        //let defaults=UserDefaults.standard
        //print(defaults.integer(forKey: "TipIndex"))
        TipSelect.addTarget(self, action: #selector(ViewController.showAnimate), for: .valueChanged)
        //billField.responds(to: Selector("onTap"))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults=UserDefaults.standard
        var val=defaults.integer(forKey: "TipIndex")
        TipSelect.selectedSegmentIndex=val
        changeSelect(index:val)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action
    
    @IBAction func BillField(_ sender: Any) {
        showAnimate()
    }
    func showAnimate()
    {
        if billField.text=="" {
            UIView.animate(withDuration: 0.4, animations:{
                self.TotalView.alpha=0
                self.TotalView.center.y=243
            })
        }else{
            UIView.animate(withDuration: 0.4, animations:{
                self.TotalView.alpha=1
                self.TotalView.center.y=360
            })
        }
        changeSelect(index:TipSelect.selectedSegmentIndex)

    }
    
    func changeSelect(index: Int)
    {
        var tipPercentages=[0.10,0.15,0.20]
        var tipPercentage=tipPercentages[index]
        var billAmount=NSString(string: billField.text!).doubleValue
        var tip=billAmount*tipPercentage
        var total=billAmount+tip
        //TipLable.text="Tip        $\(tip)"
        //TotalLable.text="Total     $\(total)"
        TipLable.text="Tip    "+String(format: "$%.2f",tip)
        TotalLable.text="Total    "+String(format: "$%.2f",total)
    }
//    @IBAction func onTap(_ sender: Any) {
//        view.endEditing(true)
//    }
    
    
    

}

