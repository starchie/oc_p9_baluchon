//
//  RefreshView.swift
//  Baluchon
//
//  Created by Gilles Sagot on 25/07/2021.
//

import UIKit

class UpdateView : UIView {
    
    var refreshButton = UIButton()
    var lastUpdateText = UITextView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(inView: UIView) {
 
        
        let rect = CGRect(x: 0, y: 0, width: inView.frame.width, height: 60)
        self.init(frame: rect)
        
        self.center.x = inView.center.x
        
        lastUpdateText.frame = CGRect(x: 0, y: 0, width: 160, height: 30)
        lastUpdateText.center.x = inView.center.x - 30
        lastUpdateText.center.y += 36
        lastUpdateText.font = UIFont(name: "HelveticaNeue", size: 16)
        lastUpdateText.textColor = UIColor.white
        lastUpdateText.textAlignment = .right
        lastUpdateText.isSelectable = false
        lastUpdateText.isEditable = false
        lastUpdateText.isScrollEnabled = false
        lastUpdateText.backgroundColor = UIColor(white: 1, alpha: 0)
        self.addSubview(lastUpdateText)
        
        
        let image = UIImage(systemName: "arrow.clockwise.circle.fill")
        refreshButton.frame = CGRect(x: lastUpdateText.frame.maxX + 5, y: 0, width: 30, height: 30)
        refreshButton.center.y += 40
        refreshButton.tintColor = UIColor.white
        refreshButton.setBackgroundImage(image, for: .normal)
        
        self.addSubview(refreshButton)
        
        
        
        
      
          
    }
}