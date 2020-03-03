//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by Ramya Seshagiri on 19/02/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit
import AudioToolbox
import  AVKit
class ViewController: UIViewController {

    let watch = Stopwatch()
    var timer = Timer()
    @IBOutlet weak var viewForLayer: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    
//    var layer = CALayer{
//        return viewForLayer.layer
//    }
    
    @IBOutlet weak var timerOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        watch.start()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        
        
//        startButton.layer.cornerRadius = 0.5*startButton.bounds.size.width
        
        // MARK:- Blur background
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(blurEffectView)
        
//        view.addSubview(addButton(title: "Start"))
        
    }
    
    @IBAction func startAction(_ sender: UIButton) {

        watch.start()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
       
    }
    //Create Button programatically
//    func addButton(title:String)-> UIButton{
//
//        let button = UIButton(type: .roundedRect)
//        button.setTitle(title, for: .init())
//        button.setTitleColor(UIColor.white, for: .init())
//        button.frame = CGRect(origin: view.center, size: CGSize(width: 150, height: 100))
//        button.backgroundColor = UIColor.red
//        return button
//
//    }
    @objc func UpdateTimer(){
        
        //counter+=0.1
        //timerOutlet.text = String(counter)
        print("Update timer")
        
        let min = Int(watch.elapsedTime/60)
        let sec = Int(watch.elapsedTime.truncatingRemainder(dividingBy: 60))
        let tenOfSeconds = Int((watch.elapsedTime*10).truncatingRemainder(dividingBy: 10))
        timerOutlet.text = String(format: "%02d:%02d:%02d", min,sec,tenOfSeconds)
        var alert:UIAlertController?
        if min == 00 && sec == 10 && tenOfSeconds == 00 {
            self.watch.stop()
            alert = UIAlertController(title: "1 Pomodoro cycle complete", message: "You can take a 5 min break if you wish to contiue.", preferredStyle: .alert)
            alert!.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (al) in
//                self.watch.start()
                self.watch.stop()
                print("yes")
            }))
            alert!.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (al) in
                self.timerOutlet.text = "00:00:00"
                self.watch.stop()
            }))
            self.present(alert!, animated: true, completion: nil)

            AudioServicesPlayAlertSound(1031)
        }
    }

//    @objc func breakTimerSelector(){
//        print("here")
//        var break_watch = Stopwatch()
//
//        let min = Int(break_watch.elapsedTime/60)
//        let sec = Int(break_watch.elapsedTime.truncatingRemainder(dividingBy: 60))
//        let tenOfSeconds = Int((break_watch.elapsedTime*10).truncatingRemainder(dividingBy: 10))
//        timerOutlet.text = String(format: "%02d:%02d:%02d", min,sec,tenOfSeconds)
//        timerOutlet.textColor = UIColor.red
//
//        if min == 1 && sec == 00 && tenOfSeconds == 00{
//            break_watch.stop()
//            var alert = UIAlertController(title: "Join back!", message: "Your 5 min break has been finished. Next cycle starts now.", preferredStyle: .alert)
//            self.watch.start()
//            self.present(alert, animated: true, completion: nil)
//        }
//    }

    
}

