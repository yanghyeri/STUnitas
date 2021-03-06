//
//  SImageCell.swift
//  STUnitas
//
//  Created by 양혜리 on 07/04/2019.
//  Copyright © 2019 양혜리. All rights reserved.
//

import UIKit
import Kingfisher

class SImageCell: UITableViewCell {

    var resultImage: ImageInfo? {
        didSet {
            if let image = resultImage {
                let resource = ImageResource(downloadURL: URL(string: image.imageURL)!, cacheKey: image.imageURL)
                searchImg.kf.setImage(with: resource)
            }
        }
    }
    
    private var searchImg: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(searchImg)
        searchImg.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        searchImg.image = nil
    }

}
