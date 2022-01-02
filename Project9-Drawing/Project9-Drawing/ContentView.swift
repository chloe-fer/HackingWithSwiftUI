//
//  ContentView.swift
//  Project9-Drawing
//
//  Created by Chloe Fermanis on 1/1/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
      
//        Text("Drawing")
//            .frame(width: 300, height: 300)
//            //.background(.red)
//            //.border(.red, width: 30)
//            .border(ImagePaint(image: Image("alice"), sourceRect: CGRect(x: 0, y: 0.25, width: 0.5, height: 0.5), scale: 0.2), width: 30)
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("alice"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
    
}

struct Flower: Shape {
    
    // how much to move petal from away from center
    var petalOffset: Double = -20
    
    // how wide to make each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        
        // the path that holds all petals
        var path = Path()
        
        // count from 0 to pi * 2, moveing up pi / 8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            // appy our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to our main path
            path.addPath(rotatedPetal)
            
        }
        
        // sent the main path back
        return path
    }
    

    
}

struct Triangle: Shape {

    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        
        let rotationAdjustment = Angle.degrees(90)
        
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
