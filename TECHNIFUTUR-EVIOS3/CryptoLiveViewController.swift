//
//  CryptoLiveViewController.swift
//  TECHNIFUTUR-EVIOS3
//
//  Created by Student08 on 12/08/2021.
//

import UIKit
import Alamofire

class CryptoLiveViewController: UIViewController {
    @IBOutlet weak var mySegmented: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    var cryptoList = [String]()
    var cryptos = [Crypto]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatas()
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {

        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "CryptoLiveTableViewCell", bundle: nil), forCellReuseIdentifier: "CryptoLiveTableViewCell")
    }

    
    func setupDatas() {
        AF.request("https://api.coincap.io/v2/assets").response { response in
            let JSONData = response.data
            let decoder = JSONDecoder()
            let result = try! decoder.decode(Data.self, from: JSONData!)
            
            self.cryptos.append(contentsOf: result.data)
            
            for crypto in self.cryptos{
                self.cryptoList.append(crypto.id)
            }
            self.myTableView.reloadData()
        }
        
        
    }
}
    
extension CryptoLiveViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cryptoCell = tableView.dequeueReusableCell(withIdentifier: "CryptoLiveTableViewCell", for: indexPath) as! CryptoLiveTableViewCell
            cryptoCell.setupCell(crypto: cryptos[indexPath.row])
            
            return cryptoCell
        }
        

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
           
            return  cryptos.count
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cryptoDetailsViewController = storyboard?.instantiateViewController(identifier: "CryptoDetailsViewController") as? CryptoDetailsViewController{
            
            
            cryptoDetailsViewController.id = cryptos[indexPath.row].id
            cryptoDetailsViewController.cryptoList = self.cryptoList
          //  cryptoDetailsViewController.nameLabel.text = cryptos[indexPath.row].name
          //  cryptoDetailsViewController.priceLabel.text = cryptos[indexPath.row].priceUsd
            
            navigationController?.pushViewController(cryptoDetailsViewController, animated: true)
        }
    }

        
}

