//
//  StripeyView.swift
//  Example
//
//  Created by Sun on 2023/9/4.
//

import UIKit

/// A view that provides diagonal stripes
public class StripeyView : UIView {
    
    /// The gap between per stripe line
    public var lineGap: CGFloat = 4 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The width of stripe line
    public var lineWidth: CGFloat = 4 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The color of stripe line
    public var lineColor = UIColor.systemGreen {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let lineWidth = self.lineWidth
        ctx.scaleBy(x: 1, y: -1)
        ctx.translateBy(x: 0, y: -bounds.size.height)
        
        let renderRect = bounds.insetBy(dx: -lineWidth * 0.5, dy: -lineWidth * 0.5)
        let totalDistance = renderRect.size.width + renderRect.size.height
        
        // loop through distances in the range 0...totalDistance
        for distance in stride(from: 0, through: totalDistance, by: (lineGap + lineWidth) / cos(.pi / 4)) {
            ctx.move(to: CGPoint(
                x: distance < renderRect.width ?
                renderRect.origin.x + distance :
                    renderRect.origin.x + renderRect.width,
                y: distance < renderRect.width ?
                renderRect.origin.y :
                    distance - (renderRect.width - renderRect.origin.x)
            ))
            
            ctx.addLine(to: CGPoint(
                x: distance < renderRect.height ?
                renderRect.origin.x :
                    distance - (renderRect.height - renderRect.origin.y),
                y: distance < renderRect.height ?
                renderRect.origin.y + distance :
                    renderRect.origin.y + renderRect.height
            ))
        }
        
        ctx.setStrokeColor(lineColor.cgColor)
        ctx.setLineWidth(lineWidth)
        ctx.strokePath()
    }
}

