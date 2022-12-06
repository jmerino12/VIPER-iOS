//
//  ExternalDataManager.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/12/22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol ExternalDataSource {
    func getDataFromServer(datos : [Post])
}

class ExternalDataManager {
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private var arrayPost = [Post]()
    private let delegate: ExternalDataSource
    private var post: Post?
    
    init(delegate: ExternalDataSource) {
        self.delegate = delegate
    }
    
    func getPost(){
        AF.request("\(baseURL)/posts").responseDecodable(of: Post.self) { response in
            if let statusCode = response.response?.statusCode {
                if (statusCode == 200){
                    do {
                        let decoder = JSONDecoder()
                        self.arrayPost = try decoder.decode([Post].self, from: response.data!)
                    } catch {
                        print("No se ha podido parsear el JSON")
                    }
                    self.delegate.getDataFromServer(datos: self.arrayPost)
                }
            }
        }
    }
}
