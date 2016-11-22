//
//  HomeViewController.swift
//  HypnosticApp
//
//  Created by Xie kesong on 9/30/16.
//  Copyright © 2016 ___KesongXie___. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class HomeViewController: UIViewController {
    
    var volume: Float = 0
    
    var stopAfter: Float = 60 * 15 //stop the music after 10s
    
    var decreasingVolumePerSecond: Float = 0
    
    @IBOutlet weak var stopMusciBtn: UIButton!
    
    
    
    @IBAction func stopMusic(_ sender: UIButton) {
        volume = AVAudioSession.sharedInstance().outputVolume
        decreasingVolumePerSecond = volume / stopAfter
        let timer = Timer(timeInterval: 1.0, target: self, selector: #selector(self.adjustVolume), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .commonModes)
        
    }
    
    func adjustVolume(){
        volume -= decreasingVolumePerSecond
        volume = max(volume, 0)
        (MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setValue(volume, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(MPVolumeView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
