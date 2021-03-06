//
//  ViewController.swift
//  ShakeItBaby
//
//  Created by Felicia Weathers on 10/8/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "", ofType: "mp3")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            
            let soundArray = ["saxophone", "xylophone", "knife_throw", "light_fuse", "rippin_explosion", "arrow_balloon", "big_String"]
            let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            let fileLocation = Bundle.main.path(forResource: soundArray[randomNumber], ofType: "mp3")

            do {
                
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                player.play()
            } catch {
                //process error
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

