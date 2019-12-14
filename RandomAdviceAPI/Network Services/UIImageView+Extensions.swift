//
//  UIImageView+Extensions.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/13/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // instance method
    
    func getImage(with urlString: String, completion: @escaping (Result<UIImage, AppError>) -> ()) {
        
//        configure UIActivityIndicatorView
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .orange
        activityIndicator.center = center // center of the UIImageView
        addSubview(activityIndicator)
        // add the UIActivityIndicatorView to the imageView
        
        activityIndicator.startAnimating()
        
        NetworkHelper.shared.performDataTask(with: urlString) { [weak activityIndicator] (result) in
            
            DispatchQueue.main.async {
                activityIndicator?.stopAnimating()
            }
            
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
    }
}
