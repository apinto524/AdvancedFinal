//
//  RootTableViewController.swift
//  FinalProject
//
//  Created by Alexandria Pinto on 3/19/16.
//  Copyright © 2016 Alexandria Pinto. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController{
    let steps = ["Translation","Primary Structure", "Secondary Structure","Tertiary and Quaternary Structure"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel!.text = steps[indexPath.row]
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            let stepNodeController = self.storyboard!.instantiateViewControllerWithIdentifier("TranslationVC")as! TranslationVC
            self.navigationController!.pushViewController(stepNodeController, animated: true)
        }
        if indexPath.row == 1{
            let stepNodeController = self.storyboard!.instantiateViewControllerWithIdentifier("PrimaryStructureVC")as! PrimaryStructureVC
            self.navigationController!.pushViewController(stepNodeController, animated: true)
        }
        if indexPath.row == 2{
            let stepNodeController = self.storyboard!.instantiateViewControllerWithIdentifier("SecondaryStructureVC")as! SecondaryStructureVC
            self.navigationController!.pushViewController(stepNodeController, animated: true)
        }
        if indexPath.row == 3{
            let stepNodeController = self.storyboard!.instantiateViewControllerWithIdentifier("TertiaryQuaternaryStructVC")as! TertiaryQuaternaryStructVC
            self.navigationController!.pushViewController(stepNodeController, animated: true)
        }
    }
}

