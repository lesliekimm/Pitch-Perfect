//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Leslie Kim on 11/21/15.
//  Copyright © 2015 Leslie Kim. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let filePathURL = NSURL.fileURLWithPath(filePath)
            audioPlayer = try! AVAudioPlayer(contentsOfURL: filePathURL)
            audioPlayer.enableRate = true
            audioEngine = AVAudioEngine()
            audioFile = try! AVAudioFile(forReading: filePathURL)
        }
        else {
            print("Error retrieving file.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playSlow(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playFast(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 2.0
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func stopPlay(sender: UIButton) {
        audioPlayer.stop()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)

        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil )
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
}
