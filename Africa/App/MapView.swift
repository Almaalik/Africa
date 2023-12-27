//
//  MapView.swift
//  Africa
//
//  Created by Abdul Maalik on 05/09/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    //MARK: - BODY
    var body: some View {
        // BASIC MAP
//        Map(coordinateRegion: $region)
        
            //ADVANCED MAP
        Map(coordinateRegion: $region,annotationItems: locations, annotationContent: { item in
            // 1- OLD PIN STYLE
//            MapPin(coordinate: item.location,tint: .accentColor)
            
            // 2- NEW PIN STYLE
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            //3 - CUSTOM BASIC ANNOTATION
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30)
            
            //4 - CUSTOM ADVANCE ANIMATION
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
                
            }// ANNOTATION
        }) //MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack{
                        Text("Lattitude:")
                            .font(.footnote)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }// HSTACK
                    Divider()
                    
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }// HSTACK
                    
                }// VSTACK
            } //HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
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
