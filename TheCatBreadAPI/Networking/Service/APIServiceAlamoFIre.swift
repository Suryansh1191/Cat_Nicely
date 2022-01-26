//
//  APIServiceAlamoFIre.swift
//  TheCatBreadAPI
//
//  Created by suryansh Bisen on 26/01/22.
//

import Foundation
import Alamofire

class APIServiceAlamoFire{
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
                AF.request(url!, method: .get).validate().responseData { response in
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        do{
                            let result = try decoder.decode(type, from: data)
                            completion(Result.success(result))
                        }catch{
                            print(error)
                            completion(Result.failure(APIError.parsing(error as? DecodingError)))
                        }
                    }
                    if let err = response.error {
                        print(err)
                    }
                }
        }
        
    }
    
