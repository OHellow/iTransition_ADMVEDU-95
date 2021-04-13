//
//  DetailVC.swift
//  FirstWorkProject
//
//  Created by Satsishur on 12.04.2021.
//

import UIKit

class DetailVC: UIViewController {
    
    private var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "cover1")
        return imageView
    }()
    
    private var songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaa"
        label.numberOfLines = 0
        return label
    }()
    
    private var artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaa"
        label.numberOfLines = 0
        return label
    }()
    
    private var albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aaaaaa"
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(albumImageView)
        view.addSubview(songNameLabel)
        view.addSubview(artistNameLabel)
        view.addSubview(albumNameLabel)
    }
    
    private func setupConstraints() {
        let imageSize = UIScreen.main.bounds.width - 20
        albumImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 30).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        artistNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        songNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 20).isActive = true
        songNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        songNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        albumNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 20).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        albumNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
