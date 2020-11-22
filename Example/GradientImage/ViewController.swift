//
//  ViewController.swift
//  GradientImage
//
//  Created by nibdevn@gmail.com on 10/25/2020.
//  Copyright (c) 2020 nibdevn@gmail.com. All rights reserved.
//

import UIKit
import GradientImage

class ViewController: UIViewController {
    
    private struct CollectionViewOption {
        var insetForSectionAt: UIEdgeInsets { UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15) }
        var minimumLineSpacingForSectionAt: CGFloat { return 10 }
        var minimumInteritemSpacingForSectionAt: CGFloat { return 10 }
        var sizeForItemAt: CGSize {
            let width = (UIScreen.main.bounds.width - insetForSectionAt.left - insetForSectionAt.right - minimumInteritemSpacingForSectionAt) / 2
            return CGSize(width: width, height: width)
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let colors: [[UIColor]]  = [
        [UIColor.red, UIColor.orange],
        [UIColor.orange, UIColor.yellow],
        [UIColor.yellow, UIColor.green],
        [UIColor.green, UIColor.blue],
        [UIColor.blue, UIColor.purple],
        [UIColor.purple, UIColor.brown],
        [UIColor.brown, UIColor.cyan],
        [UIColor.cyan, UIColor.magenta],
        [UIColor.lightGray, UIColor.darkGray],
        [UIColor.lightGray, UIColor.black],
    ]
    
    private let option: CollectionViewOption = CollectionViewOption()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurate()
    }
    
    private func configurate() {
        collectionView.register(UINib(nibName: "ColorCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ColorCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func getGradientImage(colors: [UIColor]) -> GradientImage {
        let rect = CGRect(origin: .zero, size: option.sizeForItemAt)
        return GradientImage(frame: rect, direction: .degree(270), colors: colors, locations: [0, 1])
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionViewCell", for: indexPath) as? ColorCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configurate(getGradientImage(colors: colors[indexPath.item]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return option.sizeForItemAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return option.insetForSectionAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return option.minimumLineSpacingForSectionAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return option.minimumInteritemSpacingForSectionAt
    }
}


