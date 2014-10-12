//
//  ViewController.swift
//  simple first game
//
//  Created by Siwawes Wongcharoen on 10/12/2557 BE.
//  Copyright (c) 2557 puuga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lbCoundown:UILabel!;
    var btStart:UIButton!;
    
    var timer:NSTimer!;
    var time = 10;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bindWidget();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func bindWidget() {
        lbCoundown = UILabel(frame: CGRect(x: 40, y: 40, width: 300, height: 80));
        lbCoundown.font = UIFont.systemFontOfSize(40);
        lbCoundown.textAlignment = .Center;
        lbCoundown.text = "-";
        self.view.addSubview(lbCoundown);
        
        btStart = UIButton(frame: CGRect(x: 40, y: 160, width: 300, height: 80));
        btStart.setTitle("Play", forState: .Normal);
        btStart.setTitleColor(UIColor.blueColor(), forState: .Normal);
        btStart.addTarget(self, action: "start", forControlEvents: .TouchUpInside);
        self.view.addSubview(btStart);
        
    }
    
    func start() {
        if (timer != nil) {
            stopTimer()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timeFire", userInfo: nil, repeats: true)
        lbCoundown.text = "\(time)";
        btStart.setTitle("Reset", forState: .Normal);
        
    }
    
    func timeFire() {
        time--;
        lbCoundown.text = "\(time)";
        if (time==0) {
            let alert = UIAlertView(title: "Timer", message: "Time End!", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            stopTimer();
        }
    }
    
    func stopTimer() {
        timer.invalidate();
        time = 10;
        btStart.setTitle("Play", forState: .Normal);
    }

}

