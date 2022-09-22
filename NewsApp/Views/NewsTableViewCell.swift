//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Qaisar Raza on 9/18/22.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    var newsVM: NewsViewModel? {
        didSet {
            if let newsVM = newsVM {
                titleLabel.text = newsVM.title
                NetworkManager.shared.getImage(urlString: newsVM.urlToImage) { data in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.newsImage.img = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    var newsImageData: Data? {
        didSet {
            if let data = newsImageData {
                newsImage.img = UIImage(data: data)
            }
        }
    }
    
    private lazy var newsImage: ShadowImageView = {
        let imageview = ShadowImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(titleLabel)
        addSubview(newsImage)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        //news Image
        NSLayoutConstraint.activate([
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        //title
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
