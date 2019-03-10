//
//  VideosCell.swift
//  VideoPlayer
//
//  Created by TECHIES on 3/10/19.
//  Copyright © 2019 TECHIES. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class VideosDetailsCell: UICollectionViewCell {
    
    var video: VideoDetailsModel? {
        didSet {
            let attrsA = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
            var a = NSMutableAttributedString(string:(video?.name ?? "Not Available") , attributes:attrsA)
            let attrsB =  [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.lightGray]
            let b = NSAttributedString(string:(" ==> Course Duration : " + (video?.duration ?? "Not Available")), attributes:attrsB)
            a.append(b)
            titleLabel.attributedText = a
            titleLabel.numberOfLines = 2
            
            courseLinkLabel.text = "Course Link : " + (video?.link ?? "Not Available")
            
            if let thumbnailImageUrl = video?.imageUrl {
                let placeholder = "icon_default_avatar"
                let url = URL(string: thumbnailImageUrl )
                self.thumbnailImageView.kf.setImage(with: url, placeholder: UIImage(named: placeholder))
            }
        }
    }
    
    lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_default_avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return imageView
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let courseLinkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Available"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 8)
        label.textColor = .blue
        return label
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(courseLinkLabel)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: thumbnailImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: thumbnailImageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
        //right constraint
        addConstraint(NSLayoutConstraint(item: thumbnailImageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
        
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: -10))
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: courseLinkLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: courseLinkLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: courseLinkLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -8))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
