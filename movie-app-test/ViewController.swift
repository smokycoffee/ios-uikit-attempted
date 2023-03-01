//
//  ViewController.swift
//  movie-app-test
//
//  Created by Tsenguun on 1/3/23.
//

import UIKit


enum Section {
    case main
}

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, MovieeDetailsModel>!
    
    var listOfIndexes: [MovieeDetailsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        navigationController?.navigationBar.prefersLargeTitles = true
        configureCollectionView()
        configureDataSource()
        getMovieDetails()
    }

    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColoumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MovieDetailsCell.self, forCellWithReuseIdentifier: MovieDetailsCell.reuseID)
    }
    
    func createThreeColoumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 30)
        return flowLayout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MovieeDetailsModel>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCell.reuseID, for: indexPath) as! MovieDetailsCell
            
//            cell.backgroundColor = UIColor(red: 228/255, green: 167/255, blue: 136/255, alpha: 1) // skin colour,
//            cell.backgroundColor = UIColor(red: 232/255, green: 154/255, blue: 199/255, alpha: 1) // pink
            cell.backgroundColor = .systemIndigo
            cell.set(movie: itemIdentifier)
            cell.layer.cornerRadius = 30
            
            return cell
        })
    }
    
    func updateData(on listOfIndexes: [MovieeDetailsModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MovieeDetailsModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(listOfIndexes)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }

    
    func getMovieDetails() {
        
        NetworkManager.shared.singleMovieDetail { [weak self] result in
            guard let self = self else {return} // memory leak
//            self.dismissLoading()
            switch result {
            
            case .success(let indexOfRM):
//                self.listOfIndexes.append(contentsOf: indexOfRM)
                self.listOfIndexes = indexOfRM
                print(indexOfRM)
//                self.updateData(on: self.listOfIndexes)
                self.updateData(on: self.listOfIndexes)
                
            case .failure(_):
                print("error, network call is not working")
            }
        }
    }

}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offSetY = scrollView.contentOffset.y // where youre scrolled at
        let contentHeight = scrollView.contentSize.height // is the height of the scrollview
        let height = scrollView.frame.size.height // height of screen
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let currentCharacter = activeArray[indexPath.item]
//        let destinationVC = CharInfoVC()
//        destinationVC.id = currentCharacter.id
        
//        let navigationController = UINavigationController(rootViewController: destinationVC)
//        present(navigationController, animated: true)
        
    }
}
