//
//  Network.swift
//  VideoFounder
//
//  Created by Luka Šalipur on 7.8.22..
//

import Foundation
import SwiftUI


enum Query:String, CaseIterable{
    case nature, animals, wild, holidays, nights
    
}


class Network: ObservableObject{
 @Published var search = ""
    @Published var selectedQuery = Query.nature {
        didSet{
          
                Task.init{
                    try await getVideo(topic:selectedQuery)
                }
        }
    }
    
    @Published var videos: [Video] = []

    init(){
         Task.init {
             try await getVideo(topic: selectedQuery)
        }
    }
    
    
    
    func getVideo(topic:Query) async throws{
        do{
        guard let url = URL(string:"https://api.pexels.com/videos/search?query=\(topic)&per_page=10&orientation=portrait") else { return }
        var urlRequest = URLRequest(url:url)
        urlRequest.setValue("563492ad6f917000010000017c12dc4b9d0a4620bbe3874ecab19671", forHTTPHeaderField: "Authorization")
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decoder = JSONDecoder()
            
        decoder.keyDecodingStrategy = .convertFromSnakeCase
            
        let decoded = try decoder.decode(ResponseBody.self, from: data)
        DispatchQueue.main.async {
                       self.videos = []
                       self.videos = decoded.videos
                   }
    print("Async decodedFood", decoded)
            
       
    }
        catch {
            print("Error fetching data from Pexels: \(error)")
        }
    }
}
