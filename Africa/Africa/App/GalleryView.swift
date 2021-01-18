//
//  GalleryView.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 15/01/21.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    let animals:[Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal:String = "lion"
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    //MARK: - GRID DEFINITION
//    let gridLayout:[GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    //MARK: - EFFICIENT GRID DEFINITION
//    let gridLayout:[GridItem] = Array.init(repeating: GridItem(.flexible()), count: 3)
    //MARK: - DYNAMIC GRID LAYOUT
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn:Double = 3.0
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    //MARK: - BODY
    var body: some View {
        
        //MARK: - MOTION ANIMATION
        ScrollView(.vertical,showsIndicators:false) {
            VStack(alignment: .center, spacing: 30) {
                //MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white,lineWidth: 8)
                    )
                //MARK: - SLIDER
                Slider(value: $gridColumn, in: 2...4,step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                //MARK: - GRID
                LazyVGrid(columns:gridLayout,alignment:.center,spacing:10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white,lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//: LOOP
                }//: LAZYVGRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//: VSTACK
            .padding(.horizontal,10)
            .padding(.vertical,50)
        }//: SCROLL
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(MotionAnimaitonView())
        
    }
}
//MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
