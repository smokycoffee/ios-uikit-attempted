//
//  MovieCell.swift
//  movie-app-test
//
//  Created by Tsenguun on 1/3/23.
//

import UIKit

class MovieDetailsCell: UICollectionViewCell {
    static let reuseID = "IndexCell" // identifier for cell ID
    
    var avatarImageView = MovieDetailsImageView(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movie: MovieeDetailsModel) {
        avatarImageView.getImage(from: movie.image.original)
    }
//
    private func configure() {
        
        contentView.addSubview(avatarImageView)
        let padding: CGFloat = 8
        
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
            
            
        ])
    }
}
