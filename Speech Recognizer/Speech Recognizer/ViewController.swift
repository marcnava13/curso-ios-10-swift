//
//  ViewController.swift
//  Speech Recognizer
//
//  Created by Marcos Navarro Pérez on 13/02/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet var textView: UITextView!
    
    var audioRecordingSession : AVAudioSession!
    let audioFilename : String = "audio-recordered.m4a"
    var audioRecorder : AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //recognizeSpeech()
        recordingAudioSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func recognizeSpeech () {
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                //if let path = Bundle.main.url(forResource: "audio", withExtension: "m4a") {
                let recognizer = SFSpeechRecognizer()
                let request = SFSpeechURLRecognitionRequest(url: self.directoryURL()!)
                recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else {
                        self.textView.text = result?.bestTranscription.formattedString
                    }
                })
                //}
            } else {
                print("Access denied")
            }
        }
    }
    
    func recordingAudioSetup () {
        audioRecordingSession = AVAudioSession.sharedInstance()
        do {
            try audioRecordingSession.setCategory(AVAudioSessionCategoryRecord)
            try audioRecordingSession.setActive(true)
            audioRecordingSession.requestRecordPermission({ [unowned self] (allowed : Bool) in
                if allowed {
                    self.startRecording()
                } else {
                    print("I need you permission")
                }
            })
        } catch {
            print("There are an error when we setup the microphone")
        }
    }

    func directoryURL () -> URL? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0] as URL
        return documentsDirectory.appendingPathComponent(audioFilename)
    }
    
    func startRecording () {
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000.0,
            AVNumberOfChannelsKey: 1 as NSNumber,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ] as [String : Any]
        do {
            try audioRecorder = AVAudioRecorder(url: directoryURL()!, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(self.stopRecording), userInfo: nil, repeats: false)
            
        } catch {
            print("There are a problems")
        }
    }
    
    @objc func stopRecording () {
        audioRecorder.stop()
        audioRecorder = nil
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.recognizeSpeech), userInfo: nil, repeats: false)
    }
    
}

