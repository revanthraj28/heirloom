//
//  TabelCollectionView.swift
//  loginpage 2
//
//  Created by Codebele 07 on 08/03/2022.
//

import Foundation
import UIKit

struct call {
    var titelLbl: String?
    var image: String?
    
    init(titelLbl: String,image: String?) {
        self.titelLbl = titelLbl
        self.image = image
      
   }
}

class TabelCollectionView : UIViewController , UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var gridCollection: UICollectionView!
    
    var imageList = [call]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridCollection.dequeueReusableCell(withReuseIdentifier: "GridCollectionView", for: indexPath) as! GridCollectionView
        cell.labelView.text = imageList[indexPath.row].titelLbl
        cell.profileView.image = UIImage(named: imageList[indexPath.row].image ?? "")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width / 2) , height: 270)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridCollection.register(UINib(nibName: "GridCollectionView", bundle: nil), forCellWithReuseIdentifier: "GridCollectionView")
        gridCollection.backgroundColor = UIColor(red: 0.161, green: 0.18, blue: 0.204, alpha: 1)
        gridCollection.delegate = self
        gridCollection.dataSource = self
//        self.view.backgroundColor = UIColor.black // (red: 0.161, green: 0.18, blue: 0.204, alpha: 1)
        
        imageList.append(call(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        imageList.append(call(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
        imageList.append(call(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
        imageList.append(call(titelLbl: "Japanese Maple", image: "Rectangle (3).png"))
        imageList.append(call(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        imageList.append(call(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
        imageList.append(call(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
        imageList.append(call(titelLbl: "Japanese Maple", image: "Rectangle (3).png"))
        gridCollection.reloadData()
    }
}











