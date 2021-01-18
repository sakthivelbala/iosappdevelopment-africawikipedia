//
//  CreditsView.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 17/01/21.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTIES
    //MARK: - BODY
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("""
    Copyright © Sakthivel Balakrishnan
    All rights reserved.
    Some non-sense ❤️ code.
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//:VSTACK
        .padding(10)
        .opacity(0.4)
    }
}
//MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
