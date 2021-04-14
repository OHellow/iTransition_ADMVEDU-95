//
//  API_Responce.swift
//  FirstWorkProject
//
//  Created by Satsishur on 12.04.2021.
//

import Foundation

struct iTunes_Response: Codable {
    let resultCount: Int
    let results: [iTunes_Result]
}

struct iTunes_Result: Codable {
    let wrapperType: String?
    let kind: String?
    let artistName: String?
    let trackName: String?
    let collectionName: String?
    let artistViewUrl: String?
    let collectionViewUrl, artworkUrl60, artworkUrl100: String?
    let country: String?
    let previewUrl: String?
}


