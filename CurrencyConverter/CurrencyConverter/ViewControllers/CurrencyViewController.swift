//
//  CurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Александр Савков on 14.01.22.
//

import UIKit

class CurrencyViewController: UIViewController {

    private var collectionView: UICollectionView?
    var closure: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        layout.itemSize = CGSize(width: (view.frame.size.width * 0.68) - 4,
                               height: (view.frame.size.height * 0.275) - 4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
   
    private func changeCurrent(code: String) {
        closure?(code)
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension CurrencyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        curentyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.configure(label: curentyArray[indexPath.row], image: curentyArray[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        changeCurrent(code: curentyArray[indexPath.row])
    }
}
