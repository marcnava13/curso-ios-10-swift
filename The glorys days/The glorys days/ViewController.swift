//
//  ViewController.swift
//  The glorys days
//
//  Created by Marcos Navarro Pérez on 21/02/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

import AVFoundation
import Photos
import Speech

class ViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askForPermission(_ sender: UIButton) {
        self.askForPhotosPermission()
    }
    
    func askForPhotosPermission () {
        PHPhotoLibrary.requestAuthorization { [unowned self] (authStatus) in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.askForRecordPermission()
                } else {
                    self.infoLabel.text = "You are denied the permission. Please, accept it for continue"
                }
            }
        }
    }
    
    func askForRecordPermission () {
        AVAudioSession.sharedInstance().requestRecordPermission { [unowned self] (allowed) in
            DispatchQueue.main.async {
                if allowed {
                    self.askForTranscriptionPermission()
                } else {
                    self.infoLabel.text = "You are denied the permission. Please, accept it for continue"
                }
            }
        }
    }
    
    func askForTranscriptionPermission () {
        SFSpeechRecognizer.requestAuthorization { [unowned self] (authStatus) in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.authorizationCompleted()
                } else {
                    self.infoLabel.text = "You are denied the permission. Please, accept it for continue"
                }
            }
        }
    }
    
    func authorizationCompleted () {
        dismiss(animated: true, completion: nil)
    }
    
}

