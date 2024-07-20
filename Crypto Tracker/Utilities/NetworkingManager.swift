//
//  NetworkingManager.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 20/07/2024.
//

import Foundation
import Combine

class NetworkingManager {
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { try handleUrlResponse(output: $0)}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
        
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
            switch(completion) {
            case .finished:
                break
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
    }
    
    
}
