//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Leslie Kim on 11/21/15.
//  Copyright © 2015 Leslie Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        recordButton.enabled = true
        stopButton.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordAudio(sender: UIButton) {
        recordButton.enabled = false
        recordingLabel.hidden = false
        stopButton.hidden = false
        
        // TODO: Record the user's voice
        print("in recordAudio")
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        recordButton.enabled = true
        recordingLabel.hidden = true
        stopButton.hidden = true
    }
}