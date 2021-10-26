//
//  MainTableViewCell.swift
//  KittyCatsApp
//
//  Created by Sabina Huseynova on 26.10.21.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class MainTableViewCell: UITableViewCell {
    
     let productNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
     let productImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImage.kf.cancelDownloadTask()
        productImage.image = nil
        productNameLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImage)
        addSubview(productNameLabel)
        
        productImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 150).isActive = true

        let stackView = UIStackView(arrangedSubviews: [productImage, productNameLabel])
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 50
        addSubview(stackView)
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        productNameLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 10).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
