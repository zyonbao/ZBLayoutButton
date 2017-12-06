//
//  ZBLayoutButton.swift
//  ZBLayoutButton
//
//  Created by sungrow on 2017/12/5.
//  Copyright © 2017年 picoluster. All rights reserved.
//

import UIKit

@IBDesignable
class ZBLayoutButton: UIButton {
    
    enum ZBLayoutDirection: Int {
        case imgLeft, imgRight, imgTop, imgBottom
    }
    
    @IBInspectable public var imgSize: CGSize = CGSize(width: 24, height: 24)
    @IBInspectable public var padding: CGFloat = 8.0
    
    /// Pass the value each time while you set the textlabel's attributes to help calculate textlabel size
    /// befor you add button to screen you should set it a value if it's diffrent from the default
    public var textAttributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0)]
    public var layoutDirection: ZBLayoutDirection = .imgLeft
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        // Do not try to access button.imageView in imageRect(forContentRect contentRect: CGRect) -> CGRect
        // which will cause cirulate method calling
        
        let imageSize = self.imgSize
        let titleSize: CGSize = (self.title(for: self.state)?.size(withAttributes: self.textAttributes)) ?? CGSize.zero;
        guard let _ = self.image(for: self.state) else {
            return CGRect(origin: contentRect.origin, size: .zero)
        }
        
        guard let _ = self.title(for: self.state) else {
            let x = (contentRect.width - imageSize.width)/2
            let y = (contentRect.height - imageSize.height)/2
            return CGRect(x: x + contentRect.origin.x, y: y + contentRect.origin.y, width: imageSize.width, height: imageSize.height)
        }
        
        switch self.layoutDirection {
        case .imgLeft:
            return {
                let y: CGFloat = (contentRect.height - imageSize.height)/2
                let x: CGFloat = (contentRect.width - imageSize.width - titleSize.width - padding)/2
                return CGRect(x: x + contentRect.origin.x, y: y + contentRect.origin.y, width: imgSize.width, height: imgSize.height)
                }()
        case .imgRight:
            return {
                let y: CGFloat = (contentRect.height - imageSize.height)/2
                let x: CGFloat = (contentRect.width - imageSize.width - titleSize.width - padding)/2 + titleSize.width + padding
                return CGRect(x: x + contentRect.origin.x, y: y + contentRect.origin.y, width: imgSize.width, height: imgSize.height)
                }()
        case .imgTop:
            return {
                let y: CGFloat = (contentRect.height - imageSize.height - titleSize.height - padding)/2
                let x: CGFloat = (contentRect.width - imageSize.width)/2
                return CGRect(x: x + contentRect.origin.x, y: y + contentRect.origin.y, width: imgSize.width, height: imgSize.height)
                }()
        case .imgBottom:
            return {
                let y: CGFloat = (contentRect.height - imageSize.height - titleSize.height - padding)/2 + titleSize.height + padding
                let x: CGFloat = (contentRect.width - imageSize.width)/2
                return CGRect(x: x + contentRect.origin.x,
                              y: y + contentRect.origin.y,
                              width: imgSize.width,
                              height: imgSize.height)
                }()
        }
    }

    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        // Do not try to access button.titleLabel in titleRect(forContentRect contentRect: CGRect) -> CGRect
        // which will cause cirulate method calling
        
        let imageSize = self.imgSize
        let titleSize: CGSize = (self.title(for: self.state)?.size(withAttributes: self.textAttributes)) ?? CGSize.zero;
        guard let _ = self.title(for: self.state) else {
            return CGRect(origin: contentRect.origin, size: .zero)
        }
        
        guard let _ = self.image(for: self.state) else {
            let x = (contentRect.width - titleSize.width)/2
            let y = (contentRect.height - titleSize.height)/2
            return CGRect(x: x + contentRect.origin.x, y: y + contentRect.origin.y, width: titleSize.width, height: titleSize.height);
        }
        
        switch self.layoutDirection {
        case .imgLeft:
            return {
                let txtY = (contentRect.height - titleSize.height)/2
                let txtX = (contentRect.width - imageSize.width - titleSize.width - padding)/2 + imageSize.width + padding
                return CGRect(x: txtX + contentRect.origin.x, y: txtY + contentRect.origin.y, width: titleSize.width, height: titleSize.height)
                }()
        case .imgRight:
            return {
                let txtY = (contentRect.height - titleSize.height)/2
                let txtX = (contentRect.width - imageSize.width - titleSize.width - padding)/2
                return CGRect(x: txtX + contentRect.origin.x, y: txtY + contentRect.origin.y, width: titleSize.width, height: titleSize.height)
                }()
        case .imgTop:
            return {
                let txtY = (contentRect.height - imageSize.height - titleSize.height - padding)/2 + imageSize.height + padding
                let txtX = (contentRect.width - titleSize.width)/2
                return CGRect(x: txtX + contentRect.origin.x, y: txtY + contentRect.origin.y, width: titleSize.width, height: titleSize.height)
                }()
        case .imgBottom:
            return {
                let txtY = (contentRect.height - imageSize.height - titleSize.height - padding)/2
                let txtX = (contentRect.width - titleSize.width)/2
                return CGRect(x: txtX + contentRect.origin.x, y: txtY + contentRect.origin.y, width: titleSize.width, height: titleSize.height)
                }()
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {

        let imageSize = self.imgSize
        let titleSize: CGSize = (self.title(for: self.state)?.size(withAttributes: self.textAttributes)) ?? CGSize.zero;
        
        guard let _ = self.title(for: self.state),
            let _ = self.image(for: self.state) else {
                if let _ = self.title(for: self.state) {
                    return CGSize(width: titleSize.width + self.contentEdgeInsets.left+self.contentEdgeInsets.right ,
                                  height: titleSize.height + contentEdgeInsets.top + contentEdgeInsets.bottom )
                }
                if let _ = self.image(for: self.state) {
                    return CGSize(width: imageSize.width + self.contentEdgeInsets.left+self.contentEdgeInsets.right ,
                                  height: imageSize.height + contentEdgeInsets.top + contentEdgeInsets.bottom )
                }
                return .zero
        }
        
        switch self.layoutDirection {
        case .imgLeft, .imgRight:
            return CGSize(width: imageSize.width + titleSize.width + padding + self.contentEdgeInsets.left+self.contentEdgeInsets.right,
                          height: max(imageSize.height, titleSize.height) +  contentEdgeInsets.top + contentEdgeInsets.bottom)
        case .imgTop, .imgBottom:
            return CGSize(width: max(imageSize.width , titleSize.width) +  self.contentEdgeInsets.left+self.contentEdgeInsets.right,
                          height: imageSize.height + titleSize.height + padding + contentEdgeInsets.top + contentEdgeInsets.bottom)
        }

    }
}
