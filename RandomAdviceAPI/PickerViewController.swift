//
//  PickerController.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/14/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {
    @IBOutlet var topicPickerView: UIPickerView!
    
    @IBOutlet var contentButton: UIButton!
    
    private let topics = ["Life Advice", "Chuck Norris", "Kanye Quotes"].sorted()
    
    var topicName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topicPickerView.dataSource = self
        topicPickerView.delegate = self
        
        topicName = topics.first
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let contentVC = segue.destination as? AdviceDetailController else {
            fatalError("could not load")
        }
        contentVC.topic = topicName
    }
    
    
    
}

extension PickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return topics.count
    }
}

extension PickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return topics[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        topicName = topics[row]
        
    }
    
}

