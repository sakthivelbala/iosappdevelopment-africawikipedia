//
//  MapView.swift
//  Africa
//
//  Created by Sakthivel Balakrishnan on 15/01/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    @State private var region:MKCoordinateRegion={
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    }()
    let locaitons:[NationalParkLocation] = Bundle.main.decode("locations.json")
    //MARK: - BODY
    var body: some View {
        //MARK: - NO:1 BASIC MAP
        //Map(coordinateRegion: $region)
        //MARK: - NO:2 MAP WITH ANNOTATIONS
        Map(coordinateRegion: $region, annotationItems: locaitons, annotationContent: {
            item in
            //(A) PIN old style always static
            //MapPin(coordinate: item.location, tint: .accentColor)
            //(B) PIN Marker style always static
            //MapMarker(coordinate: item.location, tint: .accentColor)
            //(C) Custom basic annotation could be interactive
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32)
//            (D) Custom advanced annotation
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }//: ANNOTATION
        })//:MAP
        .overlay(
            HStack(alignment: .center, spacing: 20, content: {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading, spacing: 3, content: {
                    HStack{
                        Text("Lattitude")
                            .font(.footnote)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }

                })//: VSTACK
            })//: HSTACK
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            ,alignment: .top
        )
    }
}
//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
