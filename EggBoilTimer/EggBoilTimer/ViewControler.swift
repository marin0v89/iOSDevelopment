import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var timer: Timer?
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton){
        
        let hardness = sender.currentTitle
        
        totalTime = eggTimes[hardness!] ?? 0
        secondsPassed = 0
        progressBar.progress = 0.0
        titleLabel.text = hardness
        
        timer?.invalidate()
        
        print("Egg Hardness: \(hardness!). Cooking time: \(totalTime) seconds.")
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            print("\(totalTime-secondsPassed) seconds.")
            secondsPassed += 1
            
            let progress = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(progress, animated: true)
        }else{
            timer?.invalidate()
            titleLabel.text = "Done"
            playSound()
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
