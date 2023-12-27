//
//  CreditsView.swift
//  Africa
//
//  Created by Abdul Maalik on 09/09/23.
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
                .frame(width: 128, height: 128)
            Text("""
    Copy Right @ Abdul
    All right reserved
    Better app less code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        } // VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
