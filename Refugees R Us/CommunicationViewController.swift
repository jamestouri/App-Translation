//
//  CommunicationViewController.swift
//  Refugees R Us
//
//  Created by James touri on 6/2/18.
//  Copyright © 2018 jamestouri. All rights reserved.
//

import UIKit
import AVFoundation

class CommunicationViewController: UIViewController, AVAudioRecorderDelegate {
    
    
    @IBOutlet weak var recordButton: UIButton!
    var audioRecorder: AVAudioRecorder!
    var recordingSession: AVAudioSession!
    var numberOfRecords = 0
    
    @IBOutlet weak var textToCommunicate: UITextView!
    var spokenString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up session
        
        recordingSession = AVAudioSession.sharedInstance()
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in
            if hasPermission {
                print("Accepted")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    @IBAction func micButton(_ sender: Any) {
        if audioRecorder == nil {
            
            //Storing the Audio Correctly
            numberOfRecords += 1
            let fileName = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                            AVSampleRateKey: 12000,
                            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            
            // Initialize the Audio recorder
            
            do {
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                recordButton.setTitle("X", for: .normal)
                
            }
            catch {
                
                recordButton.setTitle("Error! Wait a few seconds", for: .normal)
                
            }
        }
        else {
            audioRecorder.stop()
            audioRecorder = nil
            
            recordButton.setTitle("✓", for: .normal)
        }
        
        
    }
    
    // Function for audio directory
    
    func getDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
        
    }
    
    

}
