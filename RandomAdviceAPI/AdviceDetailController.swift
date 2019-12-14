//
//  AdviceDetailController.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/13/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class AdviceDetailController: UIViewController {
    
    @IBOutlet var adviceLabel: UILabel!
    
    @IBOutlet var backdropImage: UIImageView!
    
//    var ranId = Int.random(in: 100...1100).description
    
    var topic: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAdvice()
    }
    
    
    func loadAdvice() {
        adviceLabel.text = ""
        let ranImageURL = "https://picsum.photos/200/300"
        
        if topic == "Life Advice" {
            AdviceAPIClient.getAdvice { [weak self] (result) in
                switch result {
                case .failure(let appError):
                    print(appError)
                case .success(let slip):
                    DispatchQueue.main.async {
                        self?.adviceLabel.text = slip.slip.advice
                    }
                }
            }
        } else if topic == "Chuck Norris" {
            ChuckNorrisAPIClient.getNorrisFacts { [weak self] (result) in
                switch result {
                case .failure(let appError):
                    print(appError)
                case .success(let joke):
                    DispatchQueue.main.async {
                        self?.adviceLabel.text = joke.value
                    }
                }
            }
        } else {
            KanyeAPIClient.getKanyeQuotes { [weak self] (result) in
                switch result {
                case .failure(let appError):
                    print(appError)
                case .success(let kanye):
                    DispatchQueue.main.async {
                        self?.adviceLabel.text = kanye.quote
                    }
                }
            }
        }
        
        backdropImage.getImage(with: ranImageURL) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.backdropImage.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                
                DispatchQueue.main.async {
                    self?.backdropImage.image = image
                }
            }
        }
    }
    
    @IBAction func ranContent(_ sender: UIBarButtonItem) {
//        ranId = Int.random(in: 100...1100).description
        loadAdvice()
    }
    
    
}
