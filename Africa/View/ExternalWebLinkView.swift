//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Abdul Maalik on 05/09/23.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: - PROPERTIES
    
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                    Image(systemName: "arrow.up.right.square")
                }
            }// HSTACK
        }// GROUPBOX
    }
}

//MARK: - PREVIEW
struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
