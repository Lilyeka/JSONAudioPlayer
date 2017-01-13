//
//  ProductViewController.swift
//  GoodAsPhone
//
//  Created by Dmitry Torshin on 29.11.16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    var product: Product?
    //var sound = PlayMusic()
 
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var myVolumeController: UISlider!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
            if let prod = product {
                productNameLabel.text = prod.Name//"1937 Desk Phone"
            if let i = prod.productImage {
                productImageView.image = UIImage(named: i)
                }
            if let sound = prod.sound{
                sound.Play()
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
                progressView.setProgress(Float(sound.getCurrentTime()/sound.getDuration()), animated: true)
                let newTime = TimeToMinSecMSec(timeInterval: sound.getDuration())
                let strMinutes = String(format: "%02d", newTime.min)
                let strSeconds = String(format:"%02d", newTime.sec)
                durationLabel.text = "\(strMinutes):\(strSeconds)"
                sound.SetVolume(varVolume: myVolumeController.value)
                }
            }
     
        // Do any additional setup after loading the view.
    }
    func TimeToMinSecMSec(timeInterval: TimeInterval) -> (min: UInt8, sec: UInt8, msec: UInt8){
        var curTime: Float
        var resultSet: (min: UInt8, sec: UInt8, msec:UInt8)
        curTime = Float(timeInterval)
        let minutes = UInt8(curTime/60.0)
        curTime -= Float(minutes * 60)
        let seconds = UInt8(curTime)
        curTime -= Float(seconds)
        let miliSeconds = UInt8(curTime)
        resultSet.min = minutes
        resultSet.sec = seconds
        resultSet.msec = miliSeconds
        return resultSet
    }
    func updateAudioProgressView() {
        if let prod = product{
            if let sound = prod.sound {
                if sound.isPlaying() {
                    progressView.setProgress(Float(sound.getCurrentTime()/sound.getDuration()), animated: true)
                    let newTime = TimeToMinSecMSec(timeInterval: sound.getCurrentTime())
                    let strMinutes = String(format: "%02d", newTime.min)
                    let strSeconds = String(format:"%02d", newTime.sec)
                    let strMilliSec = String(format:"%02d", newTime.msec)
                    timerLabel.text = "\(strMinutes):\(strSeconds):\(strMilliSec)"            }
        }
     }
    }
    override func viewWillDisappear(_ animated: Bool) {
        if let prod = product{
             if let sound = prod.sound {
                sound.Stop()
                progressView.setProgress(0.0, animated: true)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if let prod = product{
            if let sound = prod.sound {
                sound.Stop()
                progressView.setProgress(0.0, animated: true)
            }
        }
        // Dispose of any resources that can be recreated.
    }
    
    
    
// MARK: - Actions
    
    @IBAction func controlVolume(_ sender: Any) {
        if let prod = product {
            if let sound = prod.sound {
                sound.SetVolume(varVolume: myVolumeController.value)
            }
        }
    }
    
    @IBAction func addToCardPressed(_ sender: Any) {
        if let prod = product {
            if let sound = prod.sound {
                sound.ReStart()
                progressView.setProgress(0.0, animated: true)
            }
        }
        print("Button tapped")
    }
    
    @IBAction func pauseMusicPressed(_ sender: Any) {
        if let prod = product {
            if let sound = prod.sound {
                sound.Pause()
            }
        }
    }
    
    @IBAction func playMusicPressed(_ sender: Any) {
        if let prod = product {
            if let sound = prod.sound {
                sound.Play()
                
            }
        }
    }
    
    @IBAction func stopMusicPressed(_ sender: Any) {
        if let prod = product {
            if let sound = prod.sound {
                sound.Stop()
                progressView.setProgress(0.0, animated: true)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
