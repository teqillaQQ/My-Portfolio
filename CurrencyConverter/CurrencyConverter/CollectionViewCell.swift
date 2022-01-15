//
//  CollectionViewCell.swift
//  CurrencyConverter
//
//  Created by Александр Савков on 14.01.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BYN")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "BYN"
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 27)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height - 55,
                               width: contentView.frame.size.width - 10,
                               height: 50)
        
        myImageView.frame = CGRect(x: 5,
                                y: 5,
                                width: contentView.frame.size.width - 10,
                                height: contentView.frame.size.height - myLabel.frame.size.height - 10)
    }
    
    public func configure(label: String, image: String) {
        myLabel.text = label
        myImageView.image = UIImage(named: image)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImageView.image = nil
        
    }
    
}
