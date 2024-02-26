//
//  ResultViewController.swift
//  Project1
//
//  Created by Anouar El maaroufi on 2/23/24.
//  Copyright © 2024 Anouar El maaroufi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var resultImage: UIImageView!
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        title = "Result"
        if score == 0 {
            titleLabel.text = "Your score is 0, Try again"
            resultImage.image = UIImage(named: "sad")
        } else if score >= 1 && score <= 3 {
            titleLabel.text = "Your score is \(score), Not bad"
            resultImage.image = UIImage(named: "smiling-face")
        } else if score >= 4 && score <= 6 {
            titleLabel.text = "Your score is \(score), Good job"
            resultImage.image = UIImage(named: "smiling")
        } else if score >= 7 && score <= 9 {
            titleLabel.text = "Your score is \(score), Excellent"
            resultImage.image = UIImage(named: "smiley")
        } else {
            titleLabel.text = "Your score is \(score), Legend"
            resultImage.image = UIImage(named: "cool")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
