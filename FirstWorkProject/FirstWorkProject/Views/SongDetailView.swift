//
//  SongDetailView.swift
//  FirstWorkProject
//
//  Created by Satsishur on 13.04.2021.
//

import UIKit

class SongDetailView: UIView {
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaa"
        label.numberOfLines = 0
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaa"
        label.numberOfLines = 0
        return label
    }()
    
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaa"
        label.numberOfLines = 0
        return label
    }()
    
    let playPauseButton = UIButton()

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
        addSubview(songNameLabel)
        addSubview(artistNameLabel)
        addSubview(albumNameLabel)
        addSubview(playPauseButton)
    }
    
    private func setupConstraints() {
        let imageSize = UIScreen.main.bounds.width * 0.7
        albumImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        albumImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 30).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        artistNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        songNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 20).isActive = true
        songNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        songNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        albumNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 20).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        albumNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        playPauseButton.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 30).isActive = true
        playPauseButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        playPauseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
    }
}
