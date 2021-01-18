//
//  CenterModifier.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 17/01/21.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content)-> some View{
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
