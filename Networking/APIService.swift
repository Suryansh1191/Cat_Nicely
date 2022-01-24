//
//  APIService.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 23/01/22.
//

import Foundation

struct APIService{
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        
        guard let url = url else{
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) {data, responce, error in
            
            if let error = error as? URLError{
                completion(Result.failure(APIError.url(error)))
            }else if let responce = responce as? HTTPURLResponse, !(200...299).contains(responce.statusCode){
                //show error
                completion(Result.failure(APIError.badResponse(statusCode: responce.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                
                do{
                    let result = try decoder.decode(type, from: data)
                    //print(breeds)
                    completion(Result.success(result))
                }catch{
                    print(error)
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                    
                }
            }
            
        }
        task.resume()
    }
}
    
    
//    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void){
//
//        //isLodading = true
//
//        guard let url = url else{
//            let error = APIError.badURL
//            completion(Result.failure(error))
//            return
//        }
//
//
//        let task = URLSession.shared.dataTask(with: url) {data, responce, error in
//
//            if let error = error as? URLError{
//                completion(Result.failure(APIError.url(error)))
//            }else if let responce = responce as? HTTPURLResponse, !(200...299).contains(responce.statusCode){
//                //show error
//                completion(Result.failure(APIError.badResponse(statusCode: responce.statusCode)))
//            }else if let data = data {
//                let decoder = JSONDecoder()
//
//                do{
//                    let breeds = try decoder.decode([Breed].self, from: data)
//                    //print(breeds)
//                    completion(Result.success(breeds))
//                }catch{
//                    print(error)
//                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
//
//                }
//            }
//
//        }
//        task.resume()
//    }
//}

    

