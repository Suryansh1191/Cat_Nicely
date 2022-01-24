//
//  BreeedRowView.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 20/01/22.
//

import SwiftUI

struct BreeedRowView: View {
    let breed: Breed
    var body: some View {
        HStack{
            
            if(breed.image?.url != nil){
                AsyncImage(url: URL(string: breed.image!.url!)){ phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }else if phase.error != nil {
                        Color.red
                            .frame(width: 100, height: 100)
                    }else{
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 5){
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
        

    }
}

struct BreeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        BreeedRowView(breed: Breed.example1())
    }
}
