//
//  ContentView.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 20/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var breedFetcher = BreedFetcher()
    var body: some View {
        if breedFetcher.isLodading {
            LoadingView()
        }else if breedFetcher.errorMessage != nil {
            ErrorVIew(breedFetcher: breedFetcher)
        }else{
            BreedListView(breeds: breedFetcher.breeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
