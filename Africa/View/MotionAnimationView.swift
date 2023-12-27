//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Abdul Maalik on 06/09/23.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimation: Bool = false
    //MARK: - FUNCTIONS
    
    //RANDOM COORDINATE
    func randomCoordinates(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    //RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    //RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //RANDOM SPEED
    func randomSpeeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    //RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimation ? randomScale() : 1)
                        .position(x: randomCoordinates(max: geometry.size.width), y: randomCoordinates(max: geometry.size.height))
                    
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimation = true
                        })
                } //LOOP
                .drawingGroup()
            }// ZSTACK
        } //GEOMETRY READER
    }
}

//MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
