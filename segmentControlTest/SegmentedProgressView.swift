//
//  SegmentedProgressBar.swift
//  segmentControlTest
//
//  Created by Marco Nissen on 07.10.21.
//

import Foundation
import UIKit

@IBDesignable
final class SegmentedProgressView: UIView {
    
    // MARK: - Properties
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var segmentCount: Int = 5
    @IBInspectable var segmentGap: CGFloat = 5
    @IBInspectable var segmentColor: UIColor = .lightGray
    @IBInspectable var activeSegmentColor: UIColor = .darkGray
     
    @IBInspectable var activeIndex: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Private properties
    
    private lazy var paragraphStyle: NSParagraphStyle = {
        let paragraph = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraph.alignment = .center
        return paragraph.copy() as! NSParagraphStyle
    }()
    private var segmentSize: CGFloat {
        return frame.width / CGFloat(segmentCount)
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
     }
     
    // MARK: - Actions
    
   
    // MARK: - Drawing
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
          
        for index in 0...segmentCount-1 {
            let rect = CGRect(x: CGFloat(index) * segmentSize + segmentGap/2,
                              y: 0,
                              width: segmentSize - segmentGap,
                              height: frame.height)
            if activeIndex >= index {
                context.setFillColor(activeSegmentColor.cgColor)
                let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
                path.fill()
            } else {
                context.setFillColor(segmentColor.cgColor)
                let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
                path.fill()
            }
        }
    }
    
}

