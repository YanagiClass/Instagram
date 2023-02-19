//
//  ProfileDataView.swift
//  Instagram_Snapkit
//
//  Created by 유용상 on 2023/02/19.
//

import SnapKit
import UIKit

final class ProfileDataView: UIView {
    private let title: String
    private let count: Int
    
    private lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = title
        return label
    }()
    
    private lazy var countLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.text = "\(count)"
        return label
    }()
    
    init(title: String, count: Int){
        self.count = count
        self.title = title
        
        
        super.init(frame: .zero)
        
        
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension ProfileDataView {
    func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [countLabel, titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4.0
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
