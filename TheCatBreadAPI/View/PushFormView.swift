//
//  PushFormView.swift
//  TheCatBreadAPI
//
//  Created by suryansh Bisen on 27/01/22.
//

import SwiftUI

struct PushFormView: View {
    @StateObject var apiPostCall = PostServiceAlmo();
    @State var POSTmodelView = [PostReqData]()
    @State var yourName = ""
    @State var contact = ""
    @State var address = ""
    @State var title = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("Your Name", text: $yourName).padding()
                    TextField("Enter Address", text: $contact).padding()
                    TextField("Enter Contact", text: $address).padding()
                    TextField("Enter title", text: $title).padding()
                }
            }
            Button(action: {
                let PostDataModel = PostReqData(name: yourName, Addresss: address, Title: title)
                
                apiPostCall.POSTData(DataFromView: PostDataModel){ POST in
                    POSTmodelView.append(POST)
                }
            }) {
                Text("Post Data").font(.body)
            }
            
        }.navigationTitle("Post The Data")
            .alert("Status: Success", isPresented: $apiPostCall.isError) {
                Button("OK", role: .cancel){
                    
                }
            }
    }
}

struct PushFormView_Previews: PreviewProvider {
    static var previews: some View {
        PushFormView()
    }
}
