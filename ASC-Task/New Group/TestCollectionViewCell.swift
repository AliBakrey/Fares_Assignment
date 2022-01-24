//
//  TestCollectionViewCell.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import UIKit
import CollectionViewPagingLayout

class TestCollectionViewCell: UICollectionViewCell, StackTransformView {
    var stackOptions: StackTransformViewOptions {
        .layout(.reverse)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
//import CollectionViewPagingLayout
//import UIKit
//
//class ViewController: UIViewController {
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    // MARK: Properties
//    let layout = CollectionViewPagingLayout()
//    // MARK: UIViewController
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureCollectionView()
//        reloadAndInvalidateShapes()
//        reloadDataAndLayouts()
//        layout.setCurrentPage(5, animated: false)
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        reloadAndInvalidateShapes()
//    }
//
//    // MARK: Public functions
//
//    func reloadAndInvalidateShapes() {
//        collectionView?.reloadData()
//        invalidateCollectionViewLayout()
//    }
//
//    // MARK: Private functions
//
//    private func configureCollectionView() {
//        collectionView.register(UINib(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TestCollectionViewCell")
//
//        collectionView.isPagingEnabled = true
//        collectionView.dataSource = self
//        collectionView.collectionViewLayout = layout
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.clipsToBounds = false
//        collectionView.backgroundColor = .clear
//        collectionView.delegate = self
//    }
//
//    private func reloadDataAndLayouts() {
//        collectionView?.reloadData()
//        invalidateCollectionViewLayout()
//    }
//
//    private func invalidateCollectionViewLayout() {
//        collectionView?.performBatchUpdates({ [weak self] in
//            self?.collectionView?.collectionViewLayout.invalidateLayout()
//        })
//    }
//}
//
//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == self.collectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCollectionViewCell", for: indexPath)
//            return cell
//        }
//
//        fatalError("unknown collection view")
//    }
//}
//
//extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        (collectionView.collectionViewLayout as? CollectionViewPagingLayout)?.setCurrentPage(indexPath.row) { [weak self] in
//            DispatchQueue.main.async {
//                self?.reloadAndInvalidateShapes()
//            }
//        }
//    }
//}
