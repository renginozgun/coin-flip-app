//
//  ViewController.swift
//  Coin Flip App
//
//  Created by Rengin Özgün Akbor on 13.02.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var coinImageView: UIImageView!
    override func viewDidLoad() {
        coinImageView.image = #imageLiteral(resourceName: "1_1TL_reverse")
        status.text = "Flipping"
        super.viewDidLoad()
        
        
    }

    
    @IBAction func flipButtonClicked(_ sender: UIButton) {
        status.text = "Flipping..."
        let number = Int.random(in: 0...1)
        coinImageView.animationImages = [#imageLiteral(resourceName: "1TL_obverse"), #imageLiteral(resourceName: "1_1TL_reverse")]
        coinImageView.animationDuration = 0.2
        coinImageView.animationRepeatCount = 4
        coinImageView.image = coinImageView.animationImages?.first
        coinImageView.startAnimating()
        coinImageView.image = [#imageLiteral(resourceName: "1TL_obverse"), #imageLiteral(resourceName: "1_1TL_reverse")][number]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            if(self.coinImageView.image==#imageLiteral(resourceName: "1TL_obverse")){
                self.status.text="Tails!"
            }
            if(self.coinImageView.image==#imageLiteral(resourceName: "1_1TL_reverse")){
                self.status.text="Heads!"
            }
        }
     
    }
}

