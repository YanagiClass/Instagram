//
//  ProfileCollectionViewCell.swift
//  Instagram_Snapkit
//
//  Created by 유용상 on 2023/02/19.
//

import SnapKit
import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    func setup(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
            
        }
        imageView.backgroundColor = .tertiaryLabel
    }
}
