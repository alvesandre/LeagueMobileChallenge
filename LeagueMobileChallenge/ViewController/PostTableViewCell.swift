//
//  PostTableViewCell.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 19/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import UIKit
import SDWebImage

final class PostTableViewCell: UITableViewCell {
    
    public enum Constants {
        static let CellType: UITableViewCell.Type = PostTableViewCell.self
        static let CellIdentifier: String = "PostTableViewCell"
    }
    
    // MARK: - Properties
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(userStackView)
        stack.addArrangedSubview(postStackView)
        
        return stack
    }()
    
    private lazy var userStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        
        stack.addArrangedSubview(userPhotoImageView)
        stack.addArrangedSubview(userNameLabel)
        
        return stack
    }()
    
    private lazy var userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.layer.cornerRadius = 25
        
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    private lazy var postStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(postTitleLabel)
        stack.addArrangedSubview(postContentLabel)
        
        return stack
    }()
    
    private lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var postContentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        contentView.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    // MARK: - Configuration
    
    func configureCell(with post: Post) {
        
        // User
        userPhotoImageView.sd_setImage(with: post.user?.avatar)
        userNameLabel.text = post.user?.username
        
        // Post
        postTitleLabel.text = post.title
        postContentLabel.text = post.body
        
    }
}
