//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by Ivan Pestov on 05.04.2022.
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
      
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)

    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
        
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchMusic(completion: @escaping (AppGroup?, Error?) -> ()) {
        fetchAppGroup(urlString: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/songs.json", completion: completion)
    }
    
    // helper
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // declare my generic JSON function here
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        print("T is type:", T.self)
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                completion(objects, nil)
            } catch {
                
                completion(nil, error)
                print("Failed to decode:", error)
            }
        }.resume()
    }
}

// Stack

// MARK: Generics is to declare the Type later on

//class Stack<T: Decodable> {
//    var items = [T]()
//    func push(item: T) { items.append(item) }
//    func pop() -> T? { return items.last }
//}
//
//import UIKit
//
//func dummyFunc() {
//    let stackOfStrings = Stack<String>()
//    stackOfStrings.push(item: "HAS TO BE STRING")
//
//    let stackOfInts = Stack<Int>()
//    stackOfInts.push(item: 1)
//}
