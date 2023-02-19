//
//  UIButton+.swift
//  Instagram_Snapkit
//
//  Created by 유용상 on 2023/02/19.
//

import UIKit
extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentHorizontalAlignment = .fill
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}

