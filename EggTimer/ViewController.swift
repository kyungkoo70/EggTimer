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

extension ViewController
{
    func updateDisplay(for timeRemaining: TimeInterval)
    {
        timeLeftField.stringValue = textToDisplay(for: timeRemaining)
    }
    
    private func textToDisplay(for timeRemaining: TimeInterval) -> String
    {
        if timeRemaining == 0
        {
            return "Done!"
        }
        let minutesRemaining = floor(timeRemaining/60)
        let secondsRemaining = timeRemaining - minutesRemaining*60
        let secondsDisplay = String(format: "%02d", Int(secondsRemaining))
        let timeRemainingDisplay = "\(Int(minutesRemaining)):\(secondsDisplay)"
        
        return timeRemainingDisplay
    }
    
    private func imageToDisplay(for timeRemaining: TimeInterval) ->NSImage?
    {
        let percentageComplete = 100 - (timeRemaining/360*100)
        if eggTimer.isStopped
        {
            let stoppedImageName = (timeRemaining == 0) ? "100":"stopped"
            return NSImage(named: NSImage.Name(rawValue: stoppedImageName))
        }
        let imageName:String
        switch percentageComplete
        {
        case 0..<25:
            imageName = "0"
        case 25..<50:
            imageName = "25"
        case 50..<75:
            imageName = "50"
        case 75..<100:
            imageName = "75"
        default:
            imageName = "100"
        }
        return NSImage(named: NSImage.Name(rawValue: imageName))
    }
}






































