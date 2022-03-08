//
//  Collectionview.swift
//  loginpage 2
//
//  Created by Codebele 07 on 08/03/2022.
//

import Foundation
import UIKit

struct grid {
    var titelLbl: String?
    var image: String?
    
    init(titelLbl: String,image: String?) {
        self.titelLbl = titelLbl
        self.image = image
      
   }
}

class Collectionview: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var imageList = [grid]()
    
    override func viewDidLoad() {
        imageList.append(grid(titelLbl: "demo", image: "vector (11).png"))
        imageList.append(grid(titelLbl: "BurfordHolly-Tree", image: "Rectangle(0).png"))
        imageList.append(grid(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle(1).png"))
        imageList.append(grid(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle(2).png"))
        imageList.append(grid(titelLbl: "Japanese Maple", image: "Rectangle(3).png"))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewcell", for: indexPath) as! CollectionViewcell
        
        cell.profileImageView.image = UIImage(named: imageList[indexPath.row].image ?? "")
        return cell
    }
    
    
    
    
}
