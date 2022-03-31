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
    var data:DataResponse?
}

struct DataResponse {
    var id : Int?
    var arrString : [String]?
}


struct CategoryListModel : Codable {
    var status : Bool?
    var message : String?
    var data : [CategoryListData]?
}

struct CategoryListData : Codable {
    var organization_id : String?
    var userorg_role: String?
    var organization_name: String?
}

/*
 {
 "titelLbl": "string",
 "image": "Stirng"
 "data": {
    "id": 0,
 "arrString": ["String"]
            }
 }
 */

class TabelCollectionView : UIViewController , UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var gridCollection: UICollectionView!
    
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var onsiteBtn: UIButton!
    @IBOutlet weak var Field: UIButton!
    
    
    var imageList = [call]()
    var allImageLIst = [call]()
    var onsiteImageLIst = [call]()
    var fieldImageLIst = [call]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImageLIst.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridCollection.dequeueReusableCell(withReuseIdentifier: "GridCollectionView", for: indexPath) as! GridCollectionView
        let imageData = allImageLIst[indexPath.item]
        cell.labelView.text = imageData.titelLbl
        cell.profileView.image = UIImage(named: imageData.image ?? "")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width / 2) , height: 270)
    }
    //this is used to pass data from one view controller to another in collerction view key word is( didSelectItemAt)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Passingdata") as! Passingdata
        vc.getData = allImageLIst[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
//        vc.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func allactionBtn(_ sender: Any) {
//        imageList = allImageLIst
        allAction()
    }
    
    @IBAction func onsiteActionBtn(_ sender: Any) {
        onSite()
    }
    @IBAction func fieldActionBtn(_ sender: Any) {
        fieldAction()
    }
    
    
    fileprivate func allAction() {
        //        self.view.backgroundColor = UIColor.black // (red: 0.161, green: 0.18, blue: 0.204, alpha: 1)
        allImageLIst.append(call(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        allImageLIst.append(call(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
        allImageLIst.append(call(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
        allImageLIst.append(call(titelLbl: "Japanese Maple", image: "Rectangle (3).png"))
        allImageLIst.append(call(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        allImageLIst.append(call(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
        allImageLIst.append(call(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
        allImageLIst.append(call(titelLbl: "Japanese Maple", image: "Rectangle (3).png"))
        gridCollection.reloadData()
    }
    
    fileprivate func onSite() {
        //        self.view.backgroundColor = UIColor.black // (red: 0.161, green: 0.18, blue: 0.204, alpha: 1)
        allImageLIst.append(call(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        allImageLIst.append(call(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
        allImageLIst.append(call(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
        allImageLIst.append(call(titelLbl: "Japanese Maple", image: "Rectangle (3).png"))
        
        gridCollection.reloadData()
    }
    fileprivate func fieldAction() {
        //        self.view.backgroundColor = UIColor.black // (red: 0.161, green: 0.18, blue: 0.204, alpha: 1)
        allImageLIst.append(call(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        allImageLIst.append(call(titelLbl: "DarkGreen'Lusterleaf'Holly", image: "Rectangle (1).png"))
        allImageLIst.append(call(titelLbl: "HightowerWillowOak-FulltoGround", image: "Rectangle (2).png"))
        allImageLIst.append(call(titelLbl: "Japanese Maple", image: "Rectangle (3).png"))
        allImageLIst.append(call(titelLbl: "BurfordHolly-Tree", image: "Rectangle (0).png"))
        gridCollection.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        gridCollection.register(UINib(nibName: "GridCollectionView", bundle: nil), forCellWithReuseIdentifier: "GridCollectionView")
        gridCollection.backgroundColor = UIColor(red: 0.161, green: 0.18, blue: 0.204, alpha: 1)
        gridCollection.delegate = self
        gridCollection.dataSource = self
        allAction()
        
    }
}











