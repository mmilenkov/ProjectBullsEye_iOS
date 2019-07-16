//
//  ViewController.swift
//  Project_HitMe
//
//  Created by Miloslav Milenkov on 16/07/2019.
//  Copyright © 2019 Miloslav G. Milenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var guessSlider: UISlider!
    
    var score: Int = 0
    var round: Int = 1
    var answer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guessSlider.setThumbImage(UIImage(named: "SliderThumb-Normal"), for: .normal)
        guessSlider.setThumbImage(UIImage(named: "SliderThumb-Highlighted"), for: .highlighted)
        gameLoop()
    }
    
    @IBAction func hitMeTapped(_ sender: Any) {
        incrementRound()
        calculateScore()
        let ac = UIAlertController(title: "Good job", message: "Your score is now: \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac,animated: true)
        gameLoop()
    }
    
    @IBAction func resetGame(_ sender: Any) {
        score = 0
        round = 1
        roundLabel.text = "Round: \(round)"
        scoreLabel.text = "Score: \(score)"
    }
    
    func incrementRound() {
        round += 1
        roundLabel.text = "Round: \(round)"
    }
    
    func calculateScore() {
        var value = abs(answer - Int(guessSlider.value))
        if (value == 0) {
            value = 1
        }
        score += 200 / value
        scoreLabel.text = "Score: \(score)"
    }
    
    func gameLoop() {
        answer = Int.random(in: 1...100)
        titleLabel.text = "Put the Bull's Eye as close as you can to: \(answer)"
    }
    
}

