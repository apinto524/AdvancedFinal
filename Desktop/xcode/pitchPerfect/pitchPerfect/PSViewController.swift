//
//  PSViewController.swift
//  pitchPerfect
//
//  Created by Alexandria Pinto on 2/6/16.
//  Copyright © 2016 Alexandria Pinto. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PSViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.recordingFilePath)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.recordingFilePath)

    }

    @IBAction func deep(sender: UIButton) {
        playAudioWithPitch(-1000)
    }
    @IBAction func chipmunk(sender: UIButton) {
        playAudioWithPitch(1000)
    }
    func playAudioWithPitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        let changePitch = AVAudioUnitTimePitch()
        changePitch.pitch = pitch
        audioEngine.attachNode(changePitch)
        audioEngine.connect(audioPlayerNode, to: changePitch, format: nil)
        audioEngine.connect(changePitch, to: audioEngine.outputNode, format: nil)
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        audioPlayerNode.play()
    }
    @IBAction func slowButton(sender: UIButton) {
        audioPlayer.currentTime = 0
        stopButton.hidden = false
        audioPlayer.rate = 0.5
        audioPlayer.play()
        
    }
    
    @IBAction func fastButton(sender: UIButton) {
        audioPlayer.currentTime = 0
        stopButton.hidden = false
        audioPlayer.rate = 1.5
        audioPlayer.play()
    }
    func getFile()-> NSURL{
        let filePath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("movie_quote", ofType: ".mp3")!)
        return filePath
        
    }
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop()

        stopButton.hidden = true
        
    }
}
