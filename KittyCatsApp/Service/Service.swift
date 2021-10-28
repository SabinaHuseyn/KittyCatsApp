//
//  Service.swift
//  KittyCatsApp
//
//  Created by Sabina Huseynova on 26.10.21.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchData(completion: @escaping ([CatModel], Error?) -> ()) {
        
        guard let url = URL(string: API.baseUrl) else { return }
        
        let request = URLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 5.0)
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, resp, err) in
            if let err = err {
                completion([], err)
                print("Failed to fetch news:", err)
                return
            }
            // check response
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode([CatModel].self, from: data)
                DispatchQueue.main.async {
                    completion(news, nil)
                    print(news)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
    }
}
