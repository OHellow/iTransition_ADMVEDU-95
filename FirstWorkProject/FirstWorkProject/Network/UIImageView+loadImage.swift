//
//  UIImageView+loadImage.swift
//  FirstWorkProject
//
//  Created by Satsishur on 13.04.2021.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}