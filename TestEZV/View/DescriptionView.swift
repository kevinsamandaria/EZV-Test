//
//  DescriptionView.swift
//  TestEZV
//
//  Created by Kevin  Sam Andaria on 14/03/23.
//

import SwiftUI

struct DescriptionView: View {
    @State var productData: Product
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: URL(string: productData.thumbnail),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300, maxHeight: 300)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                Group {
                    VStack(alignment: .leading, spacing: 20){
                        Text(productData.title)
                            .font(.system(size: 28))
                            .frame(alignment: .leading)
                            .tint(Color.black)
                            

                        Text(productData.description)
                            .font(.system(size: 24))
                            .frame(alignment: .leading)
                            .tint(Color.black)

                        Text("$\(productData.price)")
                            .font(.system(size:24))
                            .frame(alignment: .leading)
                            .tint(Color.black)
                    }
                }
                
                Spacer()
                    .frame(height: 20)
                
                DescriptionGridView(image: productData.images)
            }
        }
    }
}
