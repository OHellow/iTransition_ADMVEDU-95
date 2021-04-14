//
//  SearchResponceTableViewCell.swift
//  FirstWorkProject
//
//  Created by Satsishur on 13.04.2021.
//

import UIKit

class SearchResponceTableViewCell: UITableViewCell {
    
    private lazy var kindLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var artistAndTrackNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Setup View
    func setupView() {
        setSubviews()
        setupConstraints()
    }
    
    func setSubviews() {
        contentView.addSubview(kindLabel)
        contentView.addSubview(artistAndTrackNameLabel)
    }
    
    func setupConstraints() {
        kindLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        kindLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        kindLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        
        artistAndTrackNameLabel.topAnchor.constraint(equalTo: kindLabel.bottomAnchor, constant: 24).isActive = true
        artistAndTrackNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        artistAndTrackNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
    }
    // MARK: - Model configure
    func configure(model: iTunes_Result) {
        kindLabel.text = model.kind ?? "no info"
        artistAndTrackNameLabel.text = "\(model.artistName ?? "no info") - \(model.trackName ?? "no info")"
    }
}
