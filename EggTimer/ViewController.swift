//
//  ViewController.swift
//  EggTimer
//
//  Created by Kyungkoo Jun on 2018. 9. 6..
//  Copyright © 2018년 Kyungkoo Jun. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var timeLeftField: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    @IBOutlet weak var startButton: NSButtonCell!
    @IBOutlet weak var stopButton: NSButtonCell!
    @IBOutlet weak var resetButton: NSButton!
    
    @IBAction func startButtonClicked(_ sender: Any) {
    }
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    @IBAction func resetButtonClicked(_ sender: Any) {
    }
    
    // MARK: - IBActions - menus
    
    @IBAction func startTimerMenuItemSelected(_ sender: Any) {
        startButtonClicked(sender)
    }
    
    @IBAction func stopTimerMenuItemSelected(_ sender: Any) {
        stopButtonClicked(sender)
    }
    
    @IBAction func resetTimerMenuItemSelected(_ sender: Any) {
        resetButtonClicked(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eggTimer.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    var eggTimer = EggTimer()
    

}

extension ViewController:EggTimerProtocol
{
    func timeRemainingOnTimer(_ timer: EggTimer, timeRemaining: TimeInterval)
    {
        updateDisplay(for: timeRemaining)
    }
    
    func timerHasFinished(_ timer: EggTimer)
    {
        updateDisplay(for: 0)
    }
}
















