//
//  FeedViewController.swift
//  Instagram_Snapkit
//
//  Created by 유용상 on 2023/02/19.
//
import SnapKit
import UIKit

class FeedViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        return tableView
    }()
    
    private lazy var imagePickerViewController: UIImagePickerController = {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.sourceType = .photoLibrary
        imagePickerViewController.allowsEditing = true
        imagePickerViewController.delegate = self
        return imagePickerViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        
        navigationItem.title = "Instargram"
        
      
        
        
    }


}


extension FeedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell
        cell?.selectionStyle = .none
        cell?.setup()
        
        return cell ?? UITableViewCell()
    }
}

extension FeedViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //이미지 선택후 choose를 골랐을 때 실행되는 메소드
        var seletImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            seletImage = editedImage
        } else if let originImage =
                    info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            seletImage = originImage
            
        }
     
        
        picker.dismiss(animated: true) { [weak self] in
            let uploadViewController = UploadViewControlller(uploadImage: seletImage ?? UIImage())
            let navigationController = UINavigationController(rootViewController: uploadViewController)
            navigationController.modalPresentationStyle = .fullScreen
            self?.present(navigationController, animated: true)
            
            
        }
    }
}

private extension FeedViewController {
    func setupNavigationBar() {
        navigationItem.title = "Instargram"
        
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapUploadButton))
        navigationItem.rightBarButtonItem = uploadButton
        
    }
    
    @objc func didTapUploadButton() {
     present(imagePickerViewController, animated: true)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
