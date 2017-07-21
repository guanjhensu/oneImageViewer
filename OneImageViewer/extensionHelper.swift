//
//  extensionHelper.swift
//  OneImageViewer
//
//  Created by 蘇冠禎 on 2017/7/21.
//  Copyright © 2017年 蘇冠禎. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadowToView(alpha: Float, offsetWidth: Int, offsetHeight: Int, radius: Int) {
        
        self.layer.shadowColor = UIColor.black.cgColor
        
        self.layer.shadowOpacity = alpha
        
        self.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
        
        self.layer.shadowRadius = CGFloat(radius)
    }
}
