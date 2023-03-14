//
//  HomeView.swift
//  TestEZV
//
//  Created by Kevin  Sam Andaria on 14/03/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var pc: ProductController = ProductController()
    
    var body: some View {
        NavigationView{
            VStack(spacing: 60) {
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(pc.productList, id: \.id) { data in
                        NavigationLink {
                            DescriptionView(productData: data)
                                .navigationTitle("Product Description")
                        } label: {
                            VStack{
                                HStack (spacing: 20) {
                                    AsyncImage(
                                        url: URL(string: data.thumbnail),
                                        content: { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 100, maxHeight: 100)
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }
                                    )
                                    
                                    Spacer()
                                        .frame(width: 25)
                                    
                                    VStack (alignment:.leading, spacing: 15){
                                        Text(data.title)
                                            .font(.system(size: 18))
                                            .frame(alignment: .leading)
                                            .tint(Color.black)
                                            .lineLimit(nil)
                                        
                                        Text(data.brand)
                                            .font(.system(size: 14))
                                            .frame(alignment: .leading)
                                            .lineLimit(nil)
                                            .tint(Color.black)
                                        
                                        Text("$\(data.price)")
                                            .font(.system(size:14))
                                            .frame(alignment: .leading)
                                            .tint(Color.black)
                                    }
                                }
                                Rectangle()
                                    .frame(height: 2)
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 20, leading: 25, bottom: 0, trailing: 50))
            }
            .onAppear {
                pc.loadDataFromApi()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
