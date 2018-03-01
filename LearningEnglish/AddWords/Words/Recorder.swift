//
//  Recorder.swift
//  LearningEnglish
//
//  Created by vietanh on 2/28/18.
//  Copyright © 2018 BigZero. All rights reserved.
//

import UIKit
import AVFoundation

class Recorder: NSObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate{
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    func setupRecorder() {
        let recordingSession = AVAudioSession.sharedInstance()
        // Key save
        UserDefaults.standard.object(forKey: "nameRecorder")
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission{(hasPermission) in
                if hasPermission {
                    print("Accepted")
                } else {
                    print("failed to record!")
                }
            }
        } catch {
            print("error setActive and set Category")
        }
    }
    
    func startRecorder() {
        let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
        // Start audio recording
        do {
            audioRecorder = try AVAudioRecorder(url: localBlankRecordingPath(), settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
        } catch {
            print("error start recording")
        }
    }
    
    func stopRecorder() {
        audioRecorder?.stop()
        audioRecorder = nil
        // Key save
        UserDefaults.standard.set("recorder", forKey: "nameRecorder")
    }
    
    func playAudio() {
        if FileManager.default.fileExists(atPath: localBlankRecordingPath().path) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: localBlankRecordingPath())
                audioPlayer.delegate = self
                audioPlayer.play()
            } catch {
                print("Error play Audio Recorder")
            }
        } else {
            print("error file save localBankRecordingpath")
        }
    }
    
    
    // Func that gets path to directory
    func documentsDirectoryURL() -> URL {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! as String
        return URL(fileURLWithPath: path)
    }
    func localBlankRecordingPath() -> URL {
        let localBlankRecording = documentsDirectoryURL().appendingPathComponent("recorder").appendingPathExtension("m4a")
        return localBlankRecording
    }
}
