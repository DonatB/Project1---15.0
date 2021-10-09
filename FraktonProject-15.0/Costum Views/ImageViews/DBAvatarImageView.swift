//
//  DBAvatarImageView.swift
//  FraktonTestProject
//
//  Created by Donat Bajrami on 6.9.21.
//

import UIKit

class DBAvatarImageView: UIImageView {
    
    let placeholderImage = Images.fraktonLogo

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(fromURL url: String) {
        Task {
            image = await NetworkManager.shared.downloadImageAsync(from: url) ?? placeholderImage
        }
    }
}
