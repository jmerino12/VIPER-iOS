//
//  HomeViewRemoteDataManager.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/12/22.
//  
//

import Foundation
import Alamofire

enum PostError: Error {
  case errorFetching
}

class HomeViewRemoteDataManager:HomeViewRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeViewRemoteDataManagerOutputProtocol?
    
    func getPost()  {
        AF.request("https://jsonplaceholder.typicode.com/posts").responseDecodable(of: [Post].self) { response in
            if response.response?.statusCode == 200 {
                if let data = response.data {
                    let post = self.parseJSON(data)
                    self.remoteRequestHandler?.remoteDataManagerCallbackData(with: post!)
                }
            }
        }
    }
    
    func parseJSON(_ PostData: Data) -> [Post]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([Post].self, from: PostData)
            return decodedData
        } catch  {
            print(error)
            return nil
        }
                
    }
    
}
