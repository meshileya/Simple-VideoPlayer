//
//  VideoDetailsController.swift
//  VideoPlayer
//
//  Created by TECHIES on 3/10/19.
//  Copyright © 2019 TECHIES. All rights reserved.
//

import Foundation
import UIKit

class VideoDetailsController : UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, ControllerDelegate {
    
    var videoData : Video?
    let mApiService = ApiService()
    var itemList: [VideoDetailsModel] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = videoData?.name
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        view.addSubview(collectionView)
        initViews()
        initData()
    }
    
    func initViews(){
        collectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }
    
    func initData () {
        showProgress()
        mApiService.userFetchVideoDetail(videoId: String(videoData!.id)){
            (result,data, error) in
            if (result){
                self.hideProgress()
                for rideHistory in data{
                    let rDataModel = VideoDetailsModel(fromDictionary: rideHistory as! [String : Any])
                    self.itemList.append(rDataModel)
                }
                self.collectionView.reloadData()
                
            }else{
                
                print("RETURNEDFAILURE")
            }
            
        }
        
    }
    
    lazy var collectionView : DynamicCollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 8
        flowLayout.minimumInteritemSpacing = 4
        let collectionView = DynamicCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(VideosDetailsCell.self, forCellWithReuseIdentifier: "890")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .always
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: ((view.frame.width) - 40), height: 104)
        }
        else {
            return CGSize(width: view.frame.width, height: 270)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Handle on item seleted here
//        let vc = VideoDetailsController()
//        vc.videoData = itemList[indexPath.item]
//        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom :0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "890", for: indexPath) as! VideosDetailsCell
        cell.video = itemList[indexPath.item]
        return cell
    }
    
    
}
