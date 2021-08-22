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
    
    let apiURL = Bundle.main.object(forInfoDictionaryKey: "ApiURL") as! String
    
    func shortenURLPressed(text: String) {
        print("received text: \(text)")
        let urlString = apiURL + text
        
        Just.get(urlString, asyncCompletionHandler:  { result in
            
            print(result.json)
            
            self.delegate?.sendShortenedURL(result:"")
        })

    }
    
    
}


