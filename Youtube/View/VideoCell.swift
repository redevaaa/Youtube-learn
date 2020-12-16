//
//  VideoCell.swift
//  Youtube
//
//  Created by redevaaa on 2020/12/12.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            
            setupThumbnailImage()
            setupProfileImage()
            
//            thumbnailImageView.image = UIImage(named: (video?.thumbnailImageName)!)
//
//            if let profileImageName = video?.channel?.profileImageName {
//                userProfileImageView.image = UIImage(named: profileImageName)
//            }
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let subtitleText = "\(channelName) - \(numberFormatter.string(from: NSNumber(value: numberOfViews))!) - 2 years ago"
                subtitleTextView.text = subtitleText
            }
            
            //measure title text
//            if let title = video?.title {
//                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
//                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
//                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
//
//                titleLabel.snp.updateConstraints { make in
//                      make.height.equalTo(estimatedRect.size.height > 20 ? 44 : 20)
//                    }
//            }
            
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/250, blue: 230/250, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
//        label.numberOfLines = 2
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "TaylorSwiftVEVO - 1,604,684,607 views - 2 years ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
    }()
    
    func setupThumbnailImage() {
        if let thumbnailImageUrl = video?.thumbnailImageName {
            thumbnailImageView.loadImageUsingUrlString(thumbnailImageUrl)
        }
    }
    
    func setupProfileImage() {
        if let profileImageUrl = video?.channel?.profileImageName {
            userProfileImageView.loadImageUsingUrlString(profileImageUrl)
        }
    }
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separator)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        thumbnailImageView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(userProfileImageView.snp.top).offset(-8)
        }

        separator.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        userProfileImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(44)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(separator.snp.top).offset(-16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(thumbnailImageView.snp.bottom).offset(8)
            make.left.equalTo(userProfileImageView.snp.right).offset(8)
            make.right.equalTo(thumbnailImageView)
            make.height.equalTo(20)
        }
        
        subtitleTextView.snp.makeConstraints{ (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalTo(userProfileImageView.snp.right).offset(8)
            make.right.equalTo(thumbnailImageView)
            make.height.equalTo(30)
        }
    }
    
}
