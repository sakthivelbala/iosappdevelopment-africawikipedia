//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 15/01/21.
//

import SwiftUI

struct AnimalListItemView: View {
    //MARK: - PROPERTIES
    let animal:Animal
    //MARK: - BODY
    var body: some View {
        HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16, content: {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            VStack (alignment: .leading, spacing: 8, content: {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                    .padding(.trailing,2)
            })//: VSTACK
        })//: HSTACK
    }
}
//MARK: - PREVIEW
struct AnimalListItemView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListItemView(animal:animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
