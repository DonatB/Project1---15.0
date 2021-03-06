//
//  DBButton.swift
//  Project1 - 15.0
//
//  Created by Donat Bajrami on 1.9.21.
//

import UIKit

class DBButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(color: UIColor, title: String, systemImageName: String) {
        self.init(frame: .zero)
        set(color: color, title: title, systemImageName: systemImageName)
    }
    
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    final func set(color: UIColor, title: String, systemImageName: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
    
    
    final func set(backgroundColor: UIColor, foregroundColor: UIColor, title: String, systemImageName: String) {
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.baseForegroundColor = foregroundColor
        configuration?.title = title
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}
