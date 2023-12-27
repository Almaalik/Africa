//
//  InsetMapView.swift
//  Africa
//
//  Created by Abdul Maalik on 05/09/23.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK: - PROPERTIES
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }// HSTACK
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                } // NAVIGATION LINK
                    .padding(12)
                ,alignment: .topTrailing
            )
            .frame(height: 260)
            .cornerRadius(12)
    }
}


//MARK: - PREVIEW
struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
