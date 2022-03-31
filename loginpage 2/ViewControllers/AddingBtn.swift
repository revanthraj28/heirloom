//
//  AddingBtn.swift
//  loginpage 2
//
//  Created by Codebele 07 on 10/03/2022.
//

import Foundation
import UIKit


struct hello {
    var titelLbl: String?
    var image: String?
    
    
    init(titelLbl: String,image: String?) {
        self.titelLbl = titelLbl
        self.image = image
      
   }
}

class AddingBtn : UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
   
    @IBOutlet weak var gridImages: UICollectionView!
    
    var iconClick = true
    var arr = [hello]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count + 1
    }
    //actions for buttons in tabelview or collection cell
    @objc func didTapOnRow(){
        arr.append(hello(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        arr.append(hello(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
        arr.append(hello(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
        gridImages.reloadData()
    }
    @objc func colorChange(){
        //backgroundColor = .black
        //.backgroundColor = UIColor.black
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == arr.count {
            let image = gridImages.dequeueReusableCell(withReuseIdentifier: "AddingnewImage", for: indexPath) as! AddingnewImage
            image.addanItem.addTarget(self, action: #selector(self.didTapOnRow), for: .touchUpInside)
            return image
            
        } else {
            let cell = gridImages.dequeueReusableCell(withReuseIdentifier: "AddingImage", for: indexPath) as! AddingImage
            let imageData = arr[indexPath.item]
            cell.imageName.text = imageData.titelLbl
            cell.changeImg.addTarget(self, action: #selector(self.colorChange), for: .touchUpInside)
            cell.addItemImg.image = UIImage(named: imageData.image ?? "")
            return cell
        }

    }
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       if indexPath.row == arr.count {
           arr.append(hello(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
           arr.append(hello(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
           arr.append(hello(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
           gridImages.reloadData()
       } else {
           let cell = gridImages.cellForItem(at: indexPath) as? AddingImage
           cell?.changeImg.backgroundColor = .black
           
       }
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140 , height: 270)
    }
    
    @IBAction func appendaImage(_ sender: Any) {
        if (iconClick == true) {
            arr.append(hello(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
            gridImages.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridImages.register(UINib(nibName: "AddingnewImage", bundle: nil), forCellWithReuseIdentifier: "AddingnewImage")
        gridImages.register(UINib(nibName: "AddingImage", bundle: nil), forCellWithReuseIdentifier: "AddingImage")
        arr.append(hello(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        arr.append(hello(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
        arr.append(hello(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
        gridImages.delegate = self
        gridImages.dataSource = self
        gridImages.reloadData()
    }
}

