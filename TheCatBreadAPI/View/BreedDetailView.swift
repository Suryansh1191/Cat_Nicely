//
//  BreedDetailView.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 20/01/22.
//

import SwiftUI

struct BreedDetailView: View {
    let breed: Breed
    var body: some View {
        
        let imageSize: CGFloat = 300
        
                ScrollView {
                    VStack {
                        if breed.image?.url != nil {
                            AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                                if let image = phase.image {
                                    image.resizable()
                                        .scaledToFit()
                                        .frame( height: imageSize)
                                        .clipped()
                                    
                                } else if phase.error != nil {
                                    
                                    Text(phase.error?.localizedDescription ?? "error")
                                        .foregroundColor(Color.pink)
                                        .frame(width: imageSize, height: imageSize)
                                } else {
                                    ProgressView()
                                        .frame(width: imageSize, height: imageSize)
                                }
                                
                            }
                        }else {
                            Color.gray.frame(height: imageSize)
                        }
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text(breed.name)
                                .font(.headline)
                            Text(breed.temperament)
                                .font(.footnote)
                            Text(breed.explaination)
                            
                            HStack {
                                Text("Energy level \(breed.energyLevel)")
                                
                            }
                            
                            Spacer()
                        }.padding()
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.example1())
    }
}
