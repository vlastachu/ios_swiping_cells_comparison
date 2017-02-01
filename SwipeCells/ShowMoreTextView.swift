//
//  ShowMoreTextView.swift
//  actiTIME
//
//  Created by Vlad Chuprin on 03/10/16.
//  Copyright © 2016 Actimind. All rights reserved.
//

import Foundation
import UIKit

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

public func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

class ShowMoreTextView: UITextView {
    private var isCutted = false
    private var range = NSMakeRange(0, 0)
    private var cutIndex = 0
    
    private var hiddenText: String? = nil
    private var textHeight: CGFloat = 0
    //private var cuttedNumberOfLines = 4
    private let cuttedHeight: CGFloat = 50
    private let maxNumberOfLines = 0
    private let defaultFont = UIFont.systemFont(ofSize: 15, weight: UIFontWeightLight)
    private let defaultAttributes = [NSForegroundColorAttributeName:  UIColor.black,
                                     NSFontAttributeName:             UIFont.systemFont(ofSize: 15, weight: UIFontWeightLight)]
    private let linkAttributes = [NSForegroundColorAttributeName:  UIColor(red: 17/255, green: 103/255, blue: 254/255, alpha: 1),
                                  NSFontAttributeName:             UIFont.systemFont(ofSize: 15, weight: UIFontWeightLight)]
    private var bounds_: CGRect? = nil
    
    var showHideCallback: ((Bool) -> ())? = nil
    var onTextClick = {}
    
    
    override var text: String! {
        set {
            font = defaultFont
            if hiddenText == nil {
                isUserInteractionEnabled = true
                addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showHideLinkTap(_:))))
                hiddenText = newValue
                if trimmedNotEmptyString(newValue) {
                    let showMoreText = "…Show more"
                    
                    if let cutIndex = getHeightOfTextWithShowMore(showMoreText: showMoreText, inRect: frame) {
                        self.cutIndex = cutIndex
                        super.text = NSString(string: hiddenText!).substring(to: cutIndex) + "…" + "Show more"
                        setTextWithLink(text: NSString(string: hiddenText!).substring(to: cutIndex), divider: "…", link: "Show more")
                        isCutted = true
                    } else {
                        super.text = newValue
                    }
                }
            }
        }
        get {
            return super.text
        }
    }
    
    
//    
//    override var contentSize: CGSize {
//        get {
//            return CGSize(width: 30, height: 30)
//        }
//        set {
//            super.contentSize = newValue
//        }
//    }
    
    
//    override func sizeThatFits(_ size: CGSize) -> CGSize {
//        
//        if hiddenText == nil {
//            isUserInteractionEnabled = true
//            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showHideLinkTap(_:))))
//            hiddenText = text
//            if trimmedNotEmptyString(text) {
//                let showMoreText = "…Show more"
//                
//                if let cutIndex = getHeightOfTextWithShowMore(showMoreText: showMoreText, inRect: frame) {
//                    self.cutIndex = cutIndex
//                    setTextWithLink(text: NSString(string: hiddenText!).substring(to: cutIndex), divider: "…", link: "Show more")
//                    isCutted = true
//                }
//            }
//        }
//        font = defaultFont
//        
//        var result = super.sizeThatFits(size)
//        result.height = getHeight()
//        return result
//    }
//    
//    override func sizeToFit() {
//        super.sizeToFit()
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    
    func trimmedNotEmptyString(_ string: String?) -> Bool {
        return string != nil && string!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).characters.count > 0
    }
    
    func showHideLinkTap(_ tapGesture: UITapGestureRecognizer) {
        let tappedIndex = getIndexOfTappedCharacter(tapGesture: tapGesture)
        
        if NSLocationInRange(tappedIndex, range) {
            if isCutted {
                setTextWithLink(text: hiddenText!, divider: " ", link: "Hide")
                isCutted = false
            } else {
                setTextWithLink(text: NSString(string: hiddenText!).substring(to: cutIndex), divider: "…", link: "Show more")
                isCutted = true
            }
            showHideCallback?(isCutted)
        } else {
            onTextClick()
        }
    }
    
    func getHeight() -> CGFloat {
        return layoutManager.usedRect(for: textContainer).height
//        if isCutted {
//            return cuttedHeight
//        } else {
//            return textHeight + textContainer
//        }
    }
    
    private func setTextWithLink(text: String, divider: String, link: String) {
        let showMoreLink = NSAttributedString(string: link, attributes: linkAttributes)
        let textWithShowMore = NSMutableAttributedString(string: text + divider, attributes: defaultAttributes)
        range = NSMakeRange(textWithShowMore.length, showMoreLink.length)
        textWithShowMore.append(showMoreLink)
        attributedText = textWithShowMore
    }
    
    private func getIndexOfTappedCharacter(tapGesture: UITapGestureRecognizer) -> Int {
        let locationOfTouchInLabel = tapGesture.location(in: tapGesture.view)
        let textContainerOffset = self.frame.origin
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInLabel - textContainerOffset,
                                                            in: textContainer,
                                                            fractionOfDistanceBetweenInsertionPoints:nil)
        return indexOfCharacter
    }
    
    
    // returns heght of text and index which cutting text to place in rect
    private func getHeightOfTextWithShowMore(showMoreText: String, inRect rect: CGRect) -> Int? {
        let getRectHeight: (String) -> CGFloat = { [unowned self] str in
            str.boundingRect(with           : CGSize(width: rect.size.width, height: CGFloat(FLT_MAX)),
                             options        : .usesLineFragmentOrigin,
                             attributes     : [NSFontAttributeName: self.defaultFont],
                             context        : nil
            ).size.height }
        
        let nsstring = NSString(string: hiddenText!)
        
        var index = 0, prev = 0
        var textHeight: CGFloat = 0
        while textHeight <= cuttedHeight {
            prev = index
            index = nsstring.rangeOfCharacter(from: .whitespacesAndNewlines, options: [],
                                              range: NSMakeRange(index + 1, nsstring.length - index - 1)).location
            if(index != NSNotFound && index < nsstring.length) {
                
                textHeight = getRectHeight(nsstring.substring(to: index).appending(showMoreText))
            } else {
                self.textHeight = getRectHeight(nsstring as String)
                return nil
            }
        }
        self.textHeight = getRectHeight(nsstring.appending(" Hide _____")) // hack to show "hide" if text is very close to right border
        return prev
    }
}
