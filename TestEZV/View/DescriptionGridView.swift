//
//  DescriptionGridView.swift
//  TestEZV
//
//  Created by Kevin  Sam Andaria on 14/03/23.
//

import SwiftUI

struct DescriptionGridView: View {
    @State var image: [String]
    
    var gridLayout = [
            GridItem(.fixed(100),spacing: 20),
            GridItem(.fixed(100),spacing: 20),
            GridItem(.fixed(100),spacing: 20)
        ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: gridLayout, spacing: 48){
                ForEach(image, id: \.self){ img in
                    AsyncImage(
                        url: URL(string: img),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 150, maxHeight: 150)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                        
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

