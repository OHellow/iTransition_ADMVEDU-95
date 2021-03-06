//
//  NetworkService.swift
//  FirstWorkProject
//
//  Created by Satsishur on 12.04.2021.
//

import Foundation

public enum iTunesSearchError: Error {
    case emptyData
    case parsingData(Error?)
    case unknown(Error?)
}

class NetworkService {
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    public func getResults(searchTerm: String,
                           completion: @escaping (Result<iTunes_Response, iTunesSearchError>) -> Void) {
        let url = buildURL(searchTerm: searchTerm)
        print(url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let result = self.parseResponse(data: data, response: response, error: error)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
    }

    // MARK: - Private - URLs
    private func buildURL(searchTerm: String) -> URL {
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "itunes.apple.com"
//        urlComponents.path = "/search?"
        let path = "https://itunes.apple.com/search?"
        var url1 = URLComponents(string: path)
        let term = URLQueryItem(name: "term", value: searchTerm)
        url1?.queryItems?.append(term)
//        urlComponents.queryItems?.append(term)
        guard let url = url1?.url else {
            fatalError("Error: expected iTunes URL but instead it is nil")
        }
        return url
    }

    private func parseResponse(data: Data?,
                               response _: URLResponse?,
                               error: Error?) -> Result<iTunes_Response, iTunesSearchError> {
        guard let jsonData = data else {
            return .failure(iTunesSearchError.emptyData)
        }

        if let error = error {
            return .failure(iTunesSearchError.unknown(error))
        }

        do {
            let searchResponse = try decoder.decode(iTunes_Response.self, from: jsonData)
            return .success(searchResponse)
        } catch let jsonError {
            return .failure(iTunesSearchError.parsingData(jsonError))
        }
    }
}
