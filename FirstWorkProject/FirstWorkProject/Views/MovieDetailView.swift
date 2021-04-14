//
//  MovieDetail.swift
//  FirstWorkProject
//
//  Created by Satsishur on 13.04.2021.
//

import UIKit

class MovieDetailView: UIView {
    var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var movieNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaa"
        label.numberOfLines = 0
        return label
    }()
    
    var authorNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaa"
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }

    private func setupLayout() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(albumImageView)
        addSubview(authorNameLabel)
        addSubview(movieNameLabel)
    }
    
    private func setupConstraints() {
        let imageSize = UIScreen.main.bounds.width * 0.7
        albumImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        albumImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        authorNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 30).isActive = true
        authorNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        authorNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        movieNameLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 20).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        movieNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
