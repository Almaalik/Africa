//
//  CenterModifier.swift
//  Africa
//
//  Created by Abdul Maalik on 09/09/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
