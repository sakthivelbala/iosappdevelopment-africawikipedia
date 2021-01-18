//
//  VideoListView.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 15/01/21.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTIES
    @State var videos:[Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List(videos){ item in
                NavigationLink(
                    destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                    VideoListItemView(video: item)
                        .padding(.vertical,8)
                }
            }//: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos",displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:{
                        //shuffle video
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            })
        }//: NAVIGATION
    }
}
//MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
