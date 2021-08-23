//
//  NetworkRequester.swift
//  ShortenURL
//
//  Created by Mert Ejder on 15.08.2021.
//

import Foundation

class NetworkRequester {
    
    let urlString = Bundle.main.object(forInfoDictionaryKey: "ApiURL") as! String
    
    enum APPError: Error {
        case networkError(Error)
        case dataNotFound
        case jsonParsingError(Error)
        case invalidStatusCode(Int)
    }

    enum Result<T> {
        case success(T)
        case failure(APPError)
    }

    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
        let dataURL = URL(string: url)!
        let session = URLSession.shared
        let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                completion(Result.failure(APPError.networkError(error!)))
                return
            }
            guard let data = data else {
                completion(Result.failure(APPError.dataNotFound))
                return
            }
            do {
                //create decodable object from data
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
            }
        })

        task.resume()
    }
    
}
