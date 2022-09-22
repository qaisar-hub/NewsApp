//
//  HeaderView.swift
//  NewsApp
//
//  Created by Qaisar Raza on 9/18/22.
//

import UIKit

final class HeaderView: UIView {
    
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        return label
    }()
    
    private lazy var headerCircleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imageView.image = UIImage(systemName: "newspaper", withConfiguration: config)
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private lazy var plusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imageView.image = UIImage(systemName: "text.justify.left", withConfiguration: config)
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var subheadlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(fontSize)
        label.text = "Top Headlines"
        label.textColor = .gray
        return label
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        //news header
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        //subheadline
        NSLayoutConstraint.activate([
            subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}
