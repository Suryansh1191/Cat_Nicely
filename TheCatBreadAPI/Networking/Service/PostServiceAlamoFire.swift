//
//  PostServiceAlamoFire.swift
//  TheCatBreadAPI
//
//  Created by suryansh Bisen on 26/01/22.
//

import Foundation
import Alamofire

class PostServiceAlmo: ObservableObject{
    
    @Published var isError: Bool = false
    @Published var status: String = "Sucess"
    
    init() {
    }
    
    func POSTData(DataFromView: PostReqData, completionHandler: @escaping (PostReqData)->Void){
        print("working \(String(describing: DataFromView.name))")
        let body: [String: AnyHashable] = [
            "userId": 1,
            "title": DataFromView.Title,
            "body": DataFromView.Addresss,
        ]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return;
        }
        
        AF.request(url, method: .post, parameters: body,encoding: JSONEncoding.default, headers: nil).responseJSON {
        response in
          switch response.result {
                case .success:
              self.isError = true
                    print(response)
                    break
                case .failure(let error):
              self.status = "Something went wrong"
                    print(error)
          }
        }
        
    }
}




