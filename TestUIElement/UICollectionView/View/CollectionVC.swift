//
//  CollectionVC.swift
//  TestUIElement
//
//  Created by SalinChhun on 15/12/23.
//

import UIKit

class CollectionVC: UIViewController {
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    

    @IBOutlet weak var clView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        clView.delegate = self
        clView.dataSource = self
        self.clView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        // SetupGrid view
        self.setupGridView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.clView.reloadData()
        }
    }
    
    func setupGridView() {
        let flow = clView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }

}

extension CollectionVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "CollectionSB", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
        vc?.image = arrCollection[indexPath.row].image
        vc?.name = arrCollection[indexPath.row].name
        vc?.age = arrCollection[indexPath.row].age
        vc?.gender = arrCollection[indexPath.row].gender
        vc?.role = arrCollection[indexPath.row].role
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

extension CollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of items: \(arrCollection.count)")
        return arrCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 0.4
        cell.layer.cornerRadius = 20
        cell.nameView.text = arrCollection[indexPath.row].name
        cell.imageView.image = UIImage(named: arrCollection[indexPath.row].image!)
        cell.postionView.text = arrCollection[indexPath.row].role
        return cell
    }
    
    
}

extension CollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = UIScreen.main.bounds.width - 42
        return CGSize(width: collectionViewWidth / 2, height: 220)
        
    }
    // this value represents the minimum spacing between items in the same column.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    // this value represents the minimum spacing between successive columns
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

