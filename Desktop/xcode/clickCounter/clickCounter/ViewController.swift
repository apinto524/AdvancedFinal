//
//  ViewController.swift
//  clickCounter
//
//  Created by Alexandria Pinto on 2/7/16.
//  Copyright © 2016 Alexandria Pinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
    override func viewDidLoad() {

        
    }
    @IBAction func incrementCount(sender: UIButton ){
        self.count++
        self.label.text = "\(self.count)"
        plural()
        let color = randomColor()
        view.backgroundColor = color
        
    }
    

    @IBAction func decrementCount(sender: UIButton){
        self.count--
        self.label.text = "\(self.count)"
        plural()
        let color = randomColor()
        view.backgroundColor = color
        
    }
    func randomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    func plural(){
        if self.count == 1{
            self.label2.text = "click"
        } else if self.count == 0{
            self.label2.text = ""
        } else {
            self.label2.text = "clicks"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

