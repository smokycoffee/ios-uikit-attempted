//
//  MovieDetailsImageView.swift
//  movie-app-test
//
//  Created by Tsenguun on 1/3/23.
//

import UIKit

class MovieDetailsImageView: UIImageView {

    let placeholderImage = UIImage(named: "avatar-placeholder")
//    let cache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 20
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        image = placeholderImage
    }
    
    func getImage(from urlString: String) {
        let cacheKey = NSString(string: urlString)
                
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {return}
            
            if error != nil {return}
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
