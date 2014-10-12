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
    var lbQuestion:UILabel!;
    var lbLive:UILabel!;
    var btTrue:UIButton!;
    var btFalse:UIButton!;
    
    var timer:NSTimer!;
    var time = 10;
    var initLive = 5;
    var currentLive:Int!;
    
    var questionList = [
        ["Monday is yellow",true],
        ["Jedi is normal guy",false]];
    var currentQuestionIndex = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        bindWidget();
        
        currentLive = initLive;
        
        nextQuestion();
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
        
        lbQuestion = UILabel(frame: CGRect(x: 40, y: 280, width: 300, height: 80));
        lbQuestion.textAlignment = .Center;
        lbQuestion.text = "-";
        self.view.addSubview(lbQuestion);
        
        lbLive = UILabel(frame: CGRect(x: 40, y: 420, width: 300, height: 40));
        lbLive.textAlignment = .Center;
        lbLive.text = "-";
        self.view.addSubview(lbLive);
        
        
//        btStart = UIButton(frame: CGRect(x: 40, y: 160, width: 300, height: 40));
//        btStart.setTitle("Play", forState: .Normal);
//        btStart.setTitleColor(UIColor.blueColor(), forState: .Normal);
//        btStart.addTarget(self, action: "start", forControlEvents: .TouchUpInside);
//        self.view.addSubview(btStart);
        
        btTrue = UIButton(frame: CGRect(x: 40, y: 360, width: 80, height: 40));
        btTrue.setTitle("True", forState: .Normal);
        btTrue.setTitleColor(UIColor.blueColor(), forState: .Normal);
        btTrue.addTarget(self, action: "answer:", forControlEvents: .TouchUpInside);
        self.view.addSubview(btTrue);
        
        btFalse = UIButton(frame: CGRect(x: 160, y: 360, width: 80, height: 40));
        btFalse.setTitle("False", forState: .Normal);
        btFalse.setTitleColor(UIColor.blueColor(), forState: .Normal);
        btFalse.addTarget(self, action: "answer:", forControlEvents: .TouchUpInside);
        self.view.addSubview(btFalse);
        
    }
    
    func start() {
        if (timer != nil) {
            stopTimer()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timeFire", userInfo: nil, repeats: true)
        lbCoundown.text = "\(time)";
        //btStart.setTitle("Reset", forState: .Normal);
        
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
    
    func answer(sender:UIButton) {
        if sender.titleLabel?.text == "True" {
            checkAnswer(true);
        } else {
            checkAnswer(false);
        }
    }
    
    func checkAnswer(answer:Bool) {
        if (Bool(questionList[currentQuestionIndex][0] as NSNumber)) {
            currentLive = currentLive!+1;
        } else {
            currentLive = currentLive!-1;
        }
        updateLive();
        nextQuestion();
    }
    
    func updateLive() {
        lbLive.text = "\(currentLive)"
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questionList.count {
            lbQuestion.text = String(questionList[currentQuestionIndex][0] as NSString);
            currentQuestionIndex++;
            start();
        }
    }

}

