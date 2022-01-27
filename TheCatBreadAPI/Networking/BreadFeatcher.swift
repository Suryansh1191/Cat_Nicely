//
//  BreadFeatcher.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 20/01/22.
//

import Foundation
import SwiftUI

class BreedFetcher: ObservableObject{
    
    @Published var breeds = [Breed]()
    @Published var errorMessage: String? = nil
    @Published var isLodading: Bool = false
    
    init() {
        fetchALLBreedss()
    }
    
    func fetchALLBreedss(){
        
        isLodading = true
        errorMessage = nil
        
        let service = APIServiceAlamoFire()
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
        //using almofire here
        service.fetch(type(of: breeds), url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLodading = false
            }
            switch result{
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error)
            case .success(let breeds):
                DispatchQueue.main.async {
                    self.breeds = breeds
                }
            }
        }
        
//        service.fetch(type(of: breeds), url: url) { [unowned self] result in
//            DispatchQueue.main.async {
//                self.isLodading = false
//            }
//            switch result{
//            case .failure(let error):
//                self.errorMessage = error.localizedDescription
//                print(error)
//            case .success(let breeds):
//                DispatchQueue.main.async {
//                    self.breeds = breeds
//                }
//            }
//        }
    }
//
//        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else{
//            errorMessage = APIError.badURL.localizedDescription
//            return
//        }
//
//
//        let task = URLSession.shared.dataTask(with: url) {[unowned self] data, responce, error in
//
//            if let responce = responce as? HTTPURLResponse, (200, 299).contains(responce.statusCode){
//                //show error
//            }
//
//            DispatchQueue.main.async {
//                isLodading = false
//            }
//
//            let decoder = JSONDecoder()
//            if let data = data {
//                do{
//                    let breeds = try decoder.decode([Breed].self, from: data)
//                    //print(breeds)
//
//                    DispatchQueue.main.async {
//                        self.breeds = breeds
//                    }
//                }catch{
//                    print(error)
//                    DispatchQueue.main.async {
//                        self.errorMessage = "\(error)"
//                        print(error)
//                    }
//
//                }
//            }
//
//        }
        

    
   
    
}
