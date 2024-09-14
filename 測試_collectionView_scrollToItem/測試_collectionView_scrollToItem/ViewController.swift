//
//  ViewController.swift
//  測試_collectionView_scrollToItem
//
//  Created by 邱慧珊 on 2024/9/14.
//

import UIKit

class ViewController: UIViewController {

    let customCollectionView: UICollectionView = {
        //設定FlowLayout
        let layout = UICollectionViewFlowLayout()
        
        ///參考：https://medium.com/@shaibalassiano/tutorial-horizontal-uicollectionview-with-paging-9421b479ee94
        layout.minimumLineSpacing = 0              //添加後滑動不會出現白色細縫
        layout.scrollDirection = .horizontal
        
        //設定CollectionView
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCVCell.self, forCellWithReuseIdentifier: "CustomCVCell")
        
        ///參考：https://stackoverflow.com/questions/41884645/uicollectionview-scroll-to-item-not-working-with-horizontal-direction
        cv.isPagingEnabled = true                  //在配合scrollToItem運作成功，要先false執行滑動後後true
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setupUI() {
        view.addSubview(customCollectionView)
        NSLayoutConstraint.activate([
            customCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            customCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            customCollectionView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }

    
    @IBAction func tapToMoveNextPage(_ sender: Any) {
        customCollectionView.isPagingEnabled = false
        let indexPath = IndexPath(item: 2, section: 0)
        customCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        customCollectionView.isPagingEnabled = true
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //設定每個CollectionView Cell尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVCell", for: indexPath) as! CustomCVCell
        cell.label.text = "\(indexPath.row)"
                
        switch indexPath.row {
        case 0:
            cell.contentView.backgroundColor = .red
            break
        case 1:
            cell.contentView.backgroundColor = .orange
            break
        case 2:
            cell.contentView.backgroundColor = .yellow
            break
        default: break
        }
        return cell
    }
}

