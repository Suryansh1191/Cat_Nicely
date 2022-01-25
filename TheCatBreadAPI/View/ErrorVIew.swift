//
//  ErrorVIew.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 20/01/22.
//

import SwiftUI

struct ErrorVIew: View {
    @ObservedObject var breedFetcher: BreedFetcher
    var body: some View {
        Text("Oppsss....! Some Thing Went Wrong")
    }
}

struct ErrorVIew_Previews: PreviewProvider {
    static var previews: some View {
        ErrorVIew(breedFetcher: BreedFetcher())
    }
}
