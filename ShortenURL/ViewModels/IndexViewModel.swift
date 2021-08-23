//
//  IndexViewModel.swift
//  ShortenURL
//
//  Created by Mert Ejder on 15.08.2021.
//

import Foundation

protocol IndexViewModelDelegate {
    func sendShortenedURL(result: String)
}

class IndexViewModel {
    
    var delegate: IndexViewModelDelegate?
    var network = NetworkRequester()
    
    func shortenURLPressed(text: String) {
        print("received text: \(text)")
        let urlString = network.urlString + text
        
        network.dataRequest(with: urlString, objectType: ShortURLModel.self) { result in
            var shortURLResult = ""
            
            switch result {
            case .success(let resultObject):
                shortURLResult = resultObject.result.shortLink
            case .failure(let error):
                print(error)
            }
            
            self.delegate?.sendShortenedURL(result:shortURLResult)
        }
    }
    
    
}


