//
//  TranslationVC.swift
//  FinalProject
//
//  Created by Alexandria Pinto on 3/19/16.
//  Copyright © 2016 Alexandria Pinto. All rights reserved.
//

import Foundation
import UIKit

class TranslationVC: UIViewController{
    var countAA = Int()
    var peptideSize = CGSize()
    var firstAminoPoint = CGPoint()


    
    @IBOutlet weak var amino7: UIImageView!
    @IBOutlet weak var amino6: UIImageView!
    @IBOutlet weak var amino5: UIImageView!
    @IBOutlet weak var amino4: UIImageView!
    @IBOutlet weak var amino3: UIImageView!
    @IBOutlet weak var amino2: UIImageView!
    @IBOutlet weak var aminoacid: UIImageView!
    @IBOutlet weak var tRNA2: UIImageView!
    @IBOutlet weak var tRNA1: UIImageView!
    @IBOutlet weak var largeSub: UIImageView!
    @IBOutlet weak var mRNA: UIImageView!
    @IBOutlet weak var smallSub: UIImageView!
    @IBOutlet weak var viewanimation: UIButton!
    @IBOutlet weak var textField: UITextView!
   
    @IBOutlet weak var peptide: UIImageView!


    @IBOutlet weak var continuebutton: UIButton!
    @IBOutlet weak var threeprime: UILabel!
    @IBOutlet weak var fiveprime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         hideEverything()
        peptideSize = self.peptide.frame.size
        
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        hideEverything()
    }

    override func viewWillDisappear(animated: Bool) {
        
        hideEverything()
    }
    override func viewDidDisappear(animated: Bool) {
        
        hideEverything()
    }
    func hideEverything(){
        threeprime.hidden = true
        fiveprime.hidden = true
        textField.hidden = false
        smallSub.hidden = true
        mRNA.hidden = true
        largeSub.hidden = true
        tRNA1.hidden = true
        tRNA2.hidden = true
        aminoacid.hidden = true
        amino2.hidden = true
        amino3.hidden = true
        amino4.hidden = true
        amino5.hidden = true
        amino6.hidden = true
        amino7.hidden = true
        peptide.hidden = true
    }
    
    @IBAction func `continue`(sender: UIButton) {
        hideEverything()
    }
    @IBAction func viewAnimation(sender: AnyObject) {
        viewanimation.hidden = true
        continuebutton.hidden = true

        animateStart()
    }
    func animateStart(){
        largeSub.hidden = true
        tRNA1.hidden = true
        tRNA2.hidden = true
        aminoacid.hidden = true
        amino2.hidden = true
        amino3.hidden = true
        amino4.hidden = true
        amino5.hidden = true
        amino6.hidden = true
        amino7.hidden = true
        peptide.hidden = true
        textField.hidden = false
        countAA = 0
       mRNA.hidden = false
        fiveprime.hidden = false
        threeprime.hidden = false
        smallSub.hidden = false
        UIView.animateWithDuration(0.8, animations: {
            var smallFrame = self.smallSub.frame
            smallFrame.origin.y = self.mRNA.frame.minY
            smallFrame.origin.y += (smallFrame.size.height/2)

            smallFrame.origin.x = self.mRNA.frame.maxX
            smallFrame.origin.x -= (smallFrame.size.width/2)
            self.smallSub.frame = smallFrame
            
            }, completion:{ finished in
                print("yay")
                self.tRNA1Attach()
            
        })
    }
    func attachAA() -> UIImageView!{
        self.countAA = self.countAA + 1
        print("\(countAA) amino")
        var aa = UIImageView!()
        switch countAA {
        case 1:
            aa = self.aminoacid
        case 2:
            aa = self.amino2
        case 3:
            aa = self.amino3
        case 4:
            aa = self.amino4
        case 5:
            aa = self.amino5
        case 6:
            aa = self.amino6
        case 7:
            aa = self.amino7
        default: break
        }
  
        return aa
    }
    func tRNA1Attach(){
        let amino = attachAA()
        amino.frame.origin.x = tRNA1.frame.origin.x
        amino.frame.origin.y = tRNA1.frame.origin.y
        amino.frame.origin.y -= amino.frame.height / 2
        self.firstAminoPoint = amino.frame.origin
        amino.hidden = false
        tRNA1.hidden = false
        UIView.animateWithDuration(0.7, animations: {
            var tRNAFrame = self.tRNA1.frame
            var aminoFrame = amino.frame

            
            
            tRNAFrame.origin.x = self.smallSub.frame.midX
            tRNAFrame.origin.y = self.mRNA.frame.origin.y
            tRNAFrame.origin.y -= (tRNAFrame.size.height/2)
            aminoFrame.origin.x = tRNAFrame.origin.x
            aminoFrame.origin.y = tRNAFrame.minY
            aminoFrame.origin.y -= amino.frame.height / 2
            
            self.tRNA1.frame = tRNAFrame
            amino.frame = aminoFrame
            
            }, completion: {finished in
                print("add first")

                    self.addLargeSub()

        })

        
    }
    func addLargeSub(){
        largeSub.hidden = false
        UIView.animateWithDuration(0.7, animations: {
            var largeSubFrame = self.largeSub.frame
            largeSubFrame.origin.x = self.smallSub.frame.origin.x
            largeSubFrame.origin.y = self.smallSub.frame.origin.y
            largeSubFrame.origin.y -= self.largeSub.frame.height
            self.largeSub.frame = largeSubFrame
 
            }, completion:{ finished in
                
                self.addtRNA(self.tRNA2)
        
        })

        
    }
    func addtRNA(tRNA: UIImageView){
        self.peptide.hidden = false
        
        let amino = attachAA()
        amino.frame.origin.x = tRNA.frame.origin.x
        amino.frame.origin.y = tRNA.frame.origin.y
        amino.frame.origin.y -= amino.frame.height / 2
        amino.hidden = false
        tRNA.hidden = false
 
        UIView.animateWithDuration(0.7, delay: 0, options: .CurveEaseInOut, animations: {
            var tRNAFrame = tRNA.frame
            var aminoFrame = amino.frame
            tRNAFrame.origin.x = self.smallSub.frame.minX
            tRNAFrame.origin.y = self.mRNA.frame.origin.y
            tRNAFrame.origin.y -= (tRNAFrame.size.height/2)
            aminoFrame.origin.x = tRNAFrame.origin.x
            aminoFrame.origin.y = tRNAFrame.minY
            aminoFrame.origin.y -= amino.frame.height / 2
            
            var pepSize = self.peptide.frame.size
            pepSize.width = self.peptide.frame.size.width + self.peptideSize.width
            var pepFrame = self.peptide.frame
            pepFrame.origin.x = aminoFrame.origin.x
            
            
            
            tRNA.frame = tRNAFrame
            amino.frame = aminoFrame
            self.peptide.frame = pepFrame
            self.peptide.frame.size = pepSize
            
  
            
            }, completion: { finished in
                if tRNA == self.tRNA1{
                    self.detach(self.tRNA2)
                }
                if tRNA == self.tRNA2{
                    self.detach(self.tRNA1)
                }
        })

    }
    func detach(tRNA: UIImageView){
        UIView.animateWithDuration(0.7, delay: 0, options: .CurveEaseInOut, animations: {
            var tRNAFrame = tRNA.frame
            tRNAFrame.origin.x = self.view.frame.minX
            tRNAFrame.origin.y = self.view.frame.origin.y
            tRNA.frame = tRNAFrame
            }, completion: {
                finished in
                if tRNA == self.tRNA1{
                    print("I just detached 1")
                }
                if tRNA == self.tRNA2{
                    print("I just detached 2")
                }
            self.moveOver()
        })
        
    }
    func moveOver(){
        UIView.animateWithDuration(0.6, animations: {
            var moveOver1 = self.smallSub.frame
            var moveOver2 = self.largeSub.frame
            moveOver1.origin.x -= (moveOver1.width / 2)
            moveOver2.origin.x -= (moveOver2.width / 2)
        
            self.smallSub.frame = moveOver1
            self.largeSub.frame = moveOver2
            }, completion: {finished in
                if self.countAA < 7{
                    if self.countAA % 2 == 1{
                        self.addtRNA(self.tRNA2)
                    } else{
                        self.addtRNA(self.tRNA1)
                    }
                } else{
                    
                    self.disintegrate()
                }
        
        })
        
    }
    
    func disintegrate(){
 
        UIView.animateWithDuration(0.6, animations: {
            var tRNAFrame = self.tRNA1.frame
            tRNAFrame.origin.x = self.view.frame.minX
            tRNAFrame.origin.y = self.view.frame.origin.y
            self.tRNA1.frame = tRNAFrame
            var smallFrame = self.smallSub.frame
            var largeFrame = self.largeSub.frame
            smallFrame.origin.y += self.smallSub.frame.height
            largeFrame.origin.y -= (self.largeSub.frame.height / 1.5)
            
            self.smallSub.frame = smallFrame
            self.largeSub.frame = largeFrame
            
            }, completion:{ finished in
                print("hello")
        })
        viewanimation.hidden = false
 //       textField.hidden = false

        continuebutton.hidden = false
        
        //self.showQuiz()
       
    }
}

//    func showQuiz(){
//        self.hideEverything()
//        textField.hidden = true
//        viewanimation.hidden = true
//        continuebutton.hidden = true
//        
//        UIView.transitionWithView(quizContainer, duration: 1.0, options: [.CurveEaseInOut, .TransitionCurlDown], animations: {
//            self.quizContainer.hidden = false
//            //self.result.hidden = true
//            
//            if self.B.touchInside {
//               // self.result.text = "Correct"
//                //self.result.hidden = false
//                
//                
//            }
//            if self.C.touchInside || self.A.touchInside || self.D.touchInside {
//                
//            }
//            }, completion: nil)
//    }
//}
