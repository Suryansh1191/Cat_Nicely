//
//  LoadingView.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 20/01/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
                    ProgressView()
                    Text("Loading ...")
                        .foregroundColor(.gray)
                    
                }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
