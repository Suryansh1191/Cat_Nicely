//
//  BreedListView.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 20/01/22.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    
    @State private var searchText: String = ""
    
    var filteredBreeds: [Breed] {
        if searchText.count == 0 {
            return breeds
        }else{
            return breeds.filter {$0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(filteredBreeds){ breed in
                    NavigationLink{
                        BreedDetailView(breed: breed)
                    } label: {
                        BreeedRowView(breed: breed)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find Cat Nicely")
            .searchable(text: $searchText)
            .toolbar{
                NavigationLink(destination: PushFormView()) {
                    Text("PUSH DATA")
                }
            }
            
        }
        
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [Breed]())
    }
}
