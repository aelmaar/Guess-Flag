//
//  ViewController.swift
//  Project1
//
//  Created by Anouar El maaroufi on 2/22/24.
//  Copyright © 2024 Anouar El maaroufi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var correctAnswer = 0
    var score = 0
    var totalQuestions = 0
    var countries = [String]()

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia",
                      "spain", "uk", "us"]
        score = 0
        totalQuestions = 0
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        if totalQuestions >= 10 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Result") as? ResultViewController {
                vc.score = score
                // Present the alert asynchronously after current transition finishes
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        correctAnswer = Int.random(in: 0...2)
        countries.shuffle()
        totalQuestions += 1
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        

        title = "Which flag is \(countries[correctAnswer].uppercased())?"
        // set Border Width
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        // set Border color
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        // set score result in label
        scoreResult.text = "Score: \(score), Questions: \(totalQuestions)/10"
    }

    override func viewWillAppear(_ animated: Bool) {
        score = 0
        totalQuestions = 0
        scoreResult.text = "Score: \(score), Questions: \(totalQuestions)/10"
        askQuestion()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            score += 1
            self.askQuestion()
        } else {
            let ac = UIAlertController(title: "Wrong answer", message: "That's the flag of \(countries[sender.tag].uppercased())", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            if score > 0 {
                score -= 1
            }
        }
    }

}

