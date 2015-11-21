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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let filePathURL = NSURL.fileURLWithPath(filePath)
            audioPlayer = try! AVAudioPlayer(contentsOfURL: filePathURL)
            audioPlayer.enableRate = true
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
        audioPlayer.play()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
