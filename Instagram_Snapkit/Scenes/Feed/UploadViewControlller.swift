//
//  UploadViewControlller.swift
//  Instagram_Snapkit
//
//  Created by 유용상 on 2023/02/19.
//

import UIKit
import SnapKit

final class UploadViewControlller: UIViewController {
    private let uploadImage: UIImage
    
    private let imageView = UIImageView()
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        textView.delegate = self
        return textView
    }()
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationItem()
        setupLayout()
        
        imageView.image = uploadImage
    }
}

private extension UploadViewControlller {
    func setupNavigationItem() {
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didTapRightButton))
        
                                                            
                                                           
    }
    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }
    @objc func didTapRightButton() {
        dismiss(animated: true)
    }
    
    func setupLayout() {
        [imageView, textView].forEach{
            view.addSubview($0)
        }
        
        let imageViewInset: CGFloat = 16.0 //double 인지 CGFLoat인지 알려주기위해 소수점은 타입명시해준다 인트도 UINT인지 INT인지 명시
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(imageViewInset)
            make.leading.equalToSuperview().inset(imageViewInset)
            make.width.equalTo(100.0)
            make.height.equalTo(imageView.snp.width)
        }
        textView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing)
            make.trailing.equalToSuperview().inset(imageViewInset)
            make.top.equalTo(imageView.snp.top)
            make.bottom.equalTo(imageView.snp.bottom)
        }
        
    }
}


extension UploadViewControlller: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        
        textView.text = nil
        textView.textColor = .label
    }
}
