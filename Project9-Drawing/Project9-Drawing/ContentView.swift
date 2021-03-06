//
//  ContentView.swift
//  Project9-Drawing
//
//  Created by Chloe Fermanis on 1/1/22.
//

import SwiftUI

struct ContentView: View {

    //@State private var rows = 4
    //@State private var columns = 4
    
    @State private var lineWidth: CGFloat = 5.0
    @State private var colorCycle = 0.0

    var body: some View {
      
        
        VStack {
                   
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
            
        }
        
//        Arrow()
//            .stroke(.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
//            .frame(width: 300, height: 300)
//            // Challenge 2: make the line width animatable
//            .onTapGesture {
//                withAnimation {
//                    lineWidth += 5.0
//                }
//            }
        
//        CheckerBoard(rows: rows, columns: columns)
//            .onTapGesture {
//                withAnimation(.linear(duration: 3)) {
//                    rows = 8
//                    columns = 16
//                }
//            }
    }
}

// Challenge 1: create an arrow

struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    
    var amount = 0.0
    var steps = 100
    
    var body: some View {
                
        ZStack {
                
            ForEach(0..<steps) { value in
                    
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
            
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct CheckerBoard: Shape {
    
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        // figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        // loop over all rows and columns. making alternating squares colored
        for row in 0..<rows {
            
            for column in 0..<columns {
                
                if (row + column).isMultiple(of: 2) {
                    
                    // this square should be colored; add a rectangle
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    
                    path.addRect(rect)
                    
                }
            }
        }
        return path
    }
}

struct Trapezoid: Shape {
    
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct ColorCyclingCircle: View {
    
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    //.strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
                
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
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
