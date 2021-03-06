//
//  CurrencyView.swift
//  Baluchon
//
//  Created by Gilles Sagot on 13/07/2021.
//

import UIKit

class CurrencyView: UIView {
    
    let amountInDollarText = UITextField()
    let currencyCodeText = UITextView()
    let explenationText = UITextView()
    let validationButton = UIButton()
    let borderView = UIView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(inView: UIView) {
        let rect = CGRect(x: 10, y: 30, width: inView.frame.width - 20, height: 120.0)
        self.init(frame: rect)
        
        self.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        
        borderView.frame = CGRect(x:0, y:120, width: rect.width / 2,height:4)
        borderView.backgroundColor = UIColor(white: 1, alpha: 1.0)
        borderView.center.x = (rect.maxX - 10) / 2
        self.addSubview(borderView)
        
        amountInDollarText.frame = CGRect(x:10,y:20,width:180,height:50)
        amountInDollarText.textColor = UIColor.white
        amountInDollarText.backgroundColor = UIColor(white: 1, alpha: 0.0)
        amountInDollarText.font = UIFont(name: "HelveticaNeue-Bold", size: 50)
        amountInDollarText.text = "20.0"
        self.addSubview(amountInDollarText)
        
        currencyCodeText.frame = amountInDollarText.frame.offsetBy(dx: 0, dy: 50)
        currencyCodeText.textColor = UIColor.white
        currencyCodeText.backgroundColor = UIColor(white: 1, alpha: 0.0)
        currencyCodeText.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
        currencyCodeText.text = "EUR"
        currencyCodeText.isSelectable = false
        currencyCodeText.isEditable = false
        self.addSubview(currencyCodeText)
        
        validationButton.frame = CGRect(x:amountInDollarText.frame.width,y:20,width:50,height:50)
        let imageUpdate = UIImage(systemName: "checkmark.circle.fill")
        validationButton.setBackgroundImage(imageUpdate, for: .normal)
        validationButton.tintColor = UIColor.white
        self.addSubview(validationButton)
    }
    
}
