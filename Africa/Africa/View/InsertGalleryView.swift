//
//  InsertGalleryView.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 15/01/21.
//

import SwiftUI

struct InsertGalleryView: View {
    //MARK: - PROPERTIES
    let animal:Animal
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15, content: {
                    ForEach(animal.gallery,id:\.self) { item in
                        Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height:200)
                            .cornerRadius(22)
                    }//LOOP
                })//:HSTACK
            })//: SCROLL
    }
}
//MARK: - PREVIEW
struct InsertGalleryView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsertGalleryView(animal:animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
