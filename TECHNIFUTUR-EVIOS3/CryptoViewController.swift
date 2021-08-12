//
//  CryptoViewController.swift
//  TECHNIFUTUR-EVIOS3
//
//  Created by Student08 on 12/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class CryptoViewController: UIViewController {

    var cryptos = [ImageStruct]()
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatas()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {

        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "CryptoTableViewCell", bundle: nil), forCellReuseIdentifier: "CryptoTableViewCell")
    }
    func setupDatas() {
        AF.request("https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR").response { response in
            let JSONData = response.data
            let decoder = JSONDecoder()
            let result = try! decoder.decode(DataImage.self, from: JSONData!)
            
            self.cryptos.append(contentsOf: result.coins)
            
            self.myTableView.reloadData()
        }
        
        
    }
}

extension CryptoViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cryptoCell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as! CryptoTableViewCell
            cryptoCell.setupCell(detail:  cryptos[indexPath.row])
            
            return cryptoCell
        }
        

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
           
            return  cryptos.count
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

}
