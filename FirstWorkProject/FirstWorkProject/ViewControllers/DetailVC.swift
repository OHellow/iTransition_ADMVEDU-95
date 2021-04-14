//
//  DetailVC.swift
//  FirstWorkProject
//
//  Created by Satsishur on 12.04.2021.
//

import UIKit
import AVFoundation
import AVKit

enum iTunesDataType {
    case song
    case movie
}

class DetailVC: UIViewController {
    //MARK: Views
    lazy var songView = SongDetailView()
    lazy var movieView = MovieDetailView()
    //MARK: Properties
    let playerViewController = AVPlayerViewController()
    var player: AVPlayer?
    var playerItem:AVPlayerItem?
    var iTunesDataType: iTunesDataType = .song
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func loadView() {
        super.loadView()
        if iTunesDataType == .song {
            view = songView
        } else {
            view = movieView
        }
    }
    //MARK: Configure View
    func configureView(model: iTunes_Result) {
        guard let imageURL = model.artworkUrl100,
              let url = URL(string: imageURL) else {return}
        
        if model.kind == "feature-movie" {
            movieView.albumImageView.loadImage(url: url)
            movieView.authorNameLabel.text = model.artistName
            movieView.movieNameLabel.text = model.trackName
            initVideoPlayer(movieUrl: model.previewUrl)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(playVideo))
            movieView.albumImageView.isUserInteractionEnabled = true
            movieView.albumImageView.addGestureRecognizer(tap)
            } else {
            songView.songNameLabel.text = model.trackName
            songView.artistNameLabel.text = model.artistName
            songView.albumNameLabel.text = model.collectionName
            songView.albumImageView.loadImage(url: url)
            initAudioPlayer(songUrl: model.previewUrl)
            songView.playPauseButton.addTarget(self, action: #selector(playMusic), for: .touchUpInside)
        }
    }
    
    func initAudioPlayer(songUrl: String?) {
        guard let songUrl = songUrl,
              let url = URL(string: songUrl)
              else {return}
        let playerItem:AVPlayerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
    }
    
    func initVideoPlayer(movieUrl: String?) {
        guard let movieUrl = movieUrl,
              let url = URL(string: movieUrl)
              else {return}
        player = AVPlayer(url: url)
        playerViewController.player = player
    }

    @objc func playMusic() {
        print("play Button")
        DispatchQueue.main.async {
            if self.player?.rate == 0 {
                self.player?.play()
                self.songView.playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
            } else {
                self.player?.pause()
                self.songView.playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
            }
        }
    }
    
    @objc func playVideo() {
        print("play Button")
        DispatchQueue.main.async {
            self.present(self.playerViewController, animated: true) {
                self.player?.play()
            }
        }
    }
}
