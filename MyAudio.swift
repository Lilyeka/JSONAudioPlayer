//
//  MyAudio.swift
//  GoodAsPhone
//
//  Created by Dmitry Torshin on 02.12.16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation
class PlayMusic {
    
    var audioPlayer: AVAudioPlayer
    // Grab the path, make sure to add it to your project!
    //var Sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "PesenkaKotaLeo", ofType: "mp3")!)
    
    
    required init(nameOfResource: String, nameOfType:String){
        do{
            let Sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: nameOfResource, ofType: nameOfType)!)
            self.audioPlayer = try! AVAudioPlayer(contentsOf: Sound as URL)
            self.audioPlayer.prepareToPlay()
            
            var audioSession = AVAudioSession.sharedInstance()
            do{
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch{
            
            }
            
        } catch {
        print("error")
        }
    }
    
    func SetVolume(varVolume: Float) {
        audioPlayer.volume = varVolume
    }
  
    func Play() {
        audioPlayer.play()
    }
    func Stop() {
        if audioPlayer.isPlaying {
            audioPlayer.currentTime = 0
            audioPlayer.stop()
        } else {
            audioPlayer.currentTime = 0
        }
    }
    func Pause(){
        if audioPlayer.isPlaying{
            audioPlayer.pause()
        }
    }
    
    func ReStart(){
        if audioPlayer.isPlaying{
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }
        else{
            audioPlayer.play()
        }
    
    }
    
    func isPlaying() -> Bool{
        return audioPlayer.isPlaying
    }
    func getCurrentTime() -> TimeInterval{
        return audioPlayer.currentTime
    }
    func getDuration() -> TimeInterval {
        return audioPlayer.duration
    }
    
}
