//
//  CryptoDetailsViewController.swift
//  TECHNIFUTUR-EVIOS3
//
//  Created by Student08 on 12/08/2021.
//
import Alamofire
import UIKit

class CryptoDetailsViewController: UIViewController {
    
    var history = [DetailHistory]()
    var cryptoList = [String]()
    var id : String = " "
    var url : String = " "
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupDatas()
       //  setupTableView()
       // error : unable to dequeue a cell with identifier  DetailsViewCellTableViewCell pas eu le temps de trouver la solution
    }
    
    
    func setupTableView() {

        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "DetailsViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsViewCellTableViewCell")
    }
    
    func setupDatas() {
        
           // var  url = "https://api.coincap.io/v2/assets/" + id + "/history?interval=d1"
            
            AF.request("https://api.coincap.io/v2/assets/bitcoin/history?interval=d1").response { response in
                let JSONData = response.data
                let decoder = JSONDecoder()
                let result = try! decoder.decode(DataHistory.self, from: JSONData!)
                
                self.history.append(contentsOf: result.data)
                
                self.myTableView.reloadData()
            }
       
        
        
        
    }

    

}

extension CryptoDetailsViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: " DetailsViewCellTableViewCell", for: indexPath) as!  DetailsViewCellTableViewCell
            detailsCell.setupCell(history: history[indexPath.row])
            
            return detailsCell
        }
        

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
           
            return  history.count
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
