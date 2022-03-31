//
//  File.swift
//  loginpage 2
//
//  Created by Codebele 07 on 04/03/22.
//

import UIKit

struct userList {
    var title: String?
    var cityName: String?
    var link: String?
    
    init(title: String,cityName: String, link: String) {
        self.title = title
        self.cityName = cityName
        self.link = link
    }
    
}


class Tabelview : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tabelView: UITableView!
    
    var userArray = [userList]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Listtabelview", for: indexPath) as! Listtabelview
        cell.title.text = userArray[indexPath.row].title
        cell.citynameLink.text = userArray[indexPath.row].cityName
        cell.link.text = userArray[indexPath.row].link
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //used to auto fill the row
        return UITableView.automaticDimension
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.register(UINib(nibName: "Listtabelview", bundle: nil), forCellReuseIdentifier: "Listtabelview")
        tabelView.separatorStyle = .none
        tabelView.backgroundColor = .clear
        self.view.backgroundColor = UIColor(red: 0.161, green: 0.18, blue: 0.204, alpha: 1)
        
        userArray.append(userList(title: "Landscape Warrior", cityName: "Marietta, GA", link: "www.company.com"))
        userArray.append(userList(title: "ACME CompanyACME ", cityName: "Rome, GA", link: "www.acmecompany.com"))
        userArray.append(userList(title: "ACME Company", cityName: "Rome, GA", link: "www.acmecompany.com"))
        userArray.append(userList(title: "ACME CompanyACME ", cityName: "Rome, GA", link: "www.acmecompany.com"))
        userArray.append(userList(title: "ACME Company", cityName: "Rome, GA", link: "www.acmecompany.com"))
        userArray.append(userList(title: "ACME Company", cityName: "Rome, GA", link: "www.acmecompany.com"))
        tabelView.reloadData()
    }
    
}
