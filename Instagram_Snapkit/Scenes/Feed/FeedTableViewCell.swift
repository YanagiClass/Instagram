//
//  FeedTableViewCell.swift
//  Instagram_Snapkit
//
//  Created by 유용상 on 2023/02/19.
//

import SnapKit
import UIKit


final class FeedTableViewCell: UITableViewCell {
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        imageView.image = UIImage(named: "kim.jpeg")
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
       let button = UIButton()
        button.setImage(systemName: "heart")
        
        return button
    }()
    private lazy var commentButton: UIButton = {
       let button = UIButton()
        button.setImage(systemName: "message")
        
        return button
    }()
    private lazy var directMessageButton: UIButton = {
       let button = UIButton()
        button.setImage(systemName: "paperplane")
        
        return button
    }()
    private lazy var bookmarkButton: UIButton = {
       let button = UIButton()
        button.setImage(systemName: "bookmark")
        
        return button
    }()
    
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "유용상님 외 32명이 아주 좋아합니다."
        return label
    }()
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
        label.text = "1972년 11월 21일, 김두한은 오랜 지병이었던 고혈압으로 쓰러졌다. 향년 55세였고, 박정희 정권의 독재가 또 한 번의 정권 연장을 위해 유신 헌법을 통과한 지 한 달만이었다. 많은 인파가 몰린 그의 장례 행렬에는 한 무리의 어린아이들도 그 뒤를 잇고 있었다. 백야 김좌진 장군의 국가유공자 연금 전액을 매달 '삼애 고아원'이라는 곳에 기탁한 이유였다. 김두한, 그는 일제 말 우리가 주권을 잃었던 식민지 시절부터, 해방 이후 좌·우익의 대립에 이어서, 자유당 부패 정치와 5.16 박정희 정권에 이르기까지, 그의 전 생애 온몸을 다 던져 불의와 싸웠다."
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1972일전"
        return label
    }()
    
    func setup() {
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            bookmarkButton,
            currentLikedCountLabel,
            contentLabel,
            dateLabel
        ].forEach { addSubview($0) }

        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }

        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0

        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        let buttonSpacing: CGFloat = 12.0

        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(buttonSpacing)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        directMessageButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(buttonSpacing)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        bookmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        currentLikedCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }

        let labelVerticalSpacing: CGFloat = 8.0

        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(labelVerticalSpacing)
        }

        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contentLabel.snp.bottom).offset(labelVerticalSpacing)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
    
    
}
