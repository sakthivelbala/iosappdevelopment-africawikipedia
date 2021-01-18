//
//  ContentView.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 15/01/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive:Bool = false
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn:Int = 1
    @State private var toolbarIcon:String = "square.grid.2x2"
    //MARK: - FUNCTIONS
    func gridSwitch(){
        gridLayout = Array.init(repeating: .init(.flexible()), count: gridLayout.count % 3+1)
        gridColumn = gridLayout.count
        //TOOL BAR LAYOUT
        if gridColumn == 3 {
            toolbarIcon  = "rectangle.grid.1x2"
        }
        else{
            toolbarIcon = "square.grid.\(gridLayout.count % 3+1)x2"
        }
    }
    //MARK: - BODY
    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height:300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals){ item in
                            NavigationLink(
                                destination: AnimalDetailView(animal: item)
                                ) {
                                AnimalListItemView(animal: item)
                            }//: LINK
                        }//: LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    }//:LIST
                } else {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                            ForEach(animals){ animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal:animal)) {
                                    AnimalGridItemView(animal:animal)
                                }//: LINK
                            }//:LOOP
                        })//: LAZY V GRID
                        .padding(10)
                        .animation(.easeIn)
                    }//: SCROLL
                }//: ELSE CONDITION
            }//: GROUP
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar(content: {
                ToolbarItem (placement: .navigationBarTrailing) {
                    HStack(spacing:16){
                        Button (action:{
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        // GRID
                        Button(action:{
                            gridSwitch()
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//: HSTACK
                }//:BUTTON
            })//:TOOLBAR
        }//: NAVIGATION
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
