//
//  FeedPostCell.swift
//  Instagram
//
//  Created by Никита  on 23.04.2024.
//

import Foundation
import SnapKit
import UIKit

class FeedPostCell:UITableViewCell{
    
    func configure(with info: FeedPostItemPost){
        userImageView.image = info.userImage
        userNameLabel.text = info.userName
        subtitleLabel.text = info.postSubtile
        postImageView.image = info.postImage
        likesLabel.text = "\(info.numberOfLikes) Likes"
        if let comment = info.comment {
            configureCommentLabel(with: comment)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialeze()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum UIConstraint{
        static let userImageSize:CGFloat = 40
        static let contentInsert:CGFloat = 12
        static let userImageTopInsert:CGFloat = 6
        static let userNameSatckProfileImageForStack:CGFloat = 12
        static let postImageToUser:CGFloat = 6
        static let actionsStackHeight: CGFloat = 24
        static let actionsStackToPostImageOffset: CGFloat = 12
        static let actionsStackSpacing: CGFloat = 12
        static let actionsStackToLikesLabelOffset: CGFloat = 12
        static let likesLabelFontSize: CGFloat = 14
        static let commentLabelFontSize: CGFloat = 14
        static let commentToLikesOffset: CGFloat = 12
    }
    
    
    private let userImageView:UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstraint.userImageSize/2
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private let subtitleLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let optionButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let postImageView:UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstraint.likesLabelFontSize, weight: .bold)
        return label
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstraint.commentLabelFontSize)
        return label
    }()
    
    
}
private extension FeedPostCell{
    func initialeze(){
        selectionStyle = .none
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(UIConstraint.contentInsert)
            make.top.equalToSuperview().inset(UIConstraint.userImageTopInsert)
            make.size.equalTo(UIConstraint.userImageSize)
        }
        
        let userNameStack = UIStackView()
        userNameStack.axis = .vertical
        userNameStack.addArrangedSubview(userNameLabel)
        userNameStack.addArrangedSubview(subtitleLabel)
        contentView.addSubview(userNameStack)
        userNameStack.snp.makeConstraints{ make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstraint.userNameSatckProfileImageForStack)
        }
        
        contentView.addSubview(optionButton)
        optionButton.snp.makeConstraints{ make in
            make.top.trailing.equalToSuperview().inset( UIConstraint.contentInsert)
        }
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(UIConstraint.postImageToUser)
            make.height.equalTo(contentView.snp.width)
        }
        
        let actionsStack = UIStackView()
        actionsStack.axis = .horizontal
        actionsStack.addArrangedSubview(likeButton)
        actionsStack.addArrangedSubview(commentButton)
        actionsStack.addArrangedSubview(shareButton)
        actionsStack.spacing = UIConstraint.actionsStackSpacing
        contentView.addSubview(actionsStack)
        actionsStack.snp.makeConstraints { make in
            make.height.equalTo(UIConstraint.actionsStackHeight)
            make.leading.equalToSuperview().inset(UIConstraint.contentInsert)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstraint.actionsStackToPostImageOffset)
        }
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstraint.contentInsert)
            make.top.equalTo(actionsStack.snp.bottom).offset(UIConstraint.actionsStackToLikesLabelOffset)
        }
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIConstraint.contentInsert)
            make.top.equalTo(likesLabel.snp.bottom).offset(UIConstraint.commentToLikesOffset)
            make.bottom.equalToSuperview().inset(UIConstraint.contentInsert)
            
            
            
        }
        
        
    }
    
    func configureCommentLabel(with comment: CommentshortInfo) {
        let string = comment.username + " " + comment.commntText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.username.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstraint.commentLabelFontSize), range: range)
        commentLabel.attributedText = attributedString
    }
}
