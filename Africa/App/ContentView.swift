//
//  ContentView.swift
//  Africa
//
//  Created by Abdul Maalik on 05/09/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
     let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGriViewAcive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MAR: - FUNTION
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number:\(gridColumn)")
        //TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    //MARK: - BODY
    var body: some View {
        NavigationView {
            
            Group {
                if !isGriViewAcive {
                    List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }// NAVIGATION LINK
                        }//LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    }//LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                }// NAVIGATION LINK
                            }//LOOP
                        }// LAZYVGRID
                        .padding(10)
                        .animation(.easeIn)
                    }// SCROLLVIEW
                    
                }// CONDITIONAL
            }// GROUP
                        .frame(width: UIScreen.main.bounds.width + 50)
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                     //LIST BUTTON
                        Button(action: {
                            isGriViewAcive = false
                            haptics.impactOccurred()
                        }) {
                          Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGriViewAcive ? .primary : .accentColor)
                        }
                        
                        //GRID BUTTON
                        Button(action: {
                            isGriViewAcive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                            .font(.title2)
                            .foregroundColor(isGriViewAcive ? .accentColor : .primary)
                        }
                    }//HSTACK
                }//TOOLBAR ITEM
            }// TOOLBAR
        }// NAVIGATION
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
