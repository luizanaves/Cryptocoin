//
//  ViewController.swift
//  CryptoCoin
//
//  Created by Luiza Negreiros Naves - LNA on 05/05/21.
//

import UIKit

class CoinViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableOfCoins: UITableView!
    
    
    var listOfCoins: [DataCoin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCoins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = listOfCoins[indexPath.row]
        
        cell.textLabel?.text = "\(data.name) - \(data.symbol)"
        cell.detailTextLabel?.text = "\(data.quote.USD.price)"
        
    return cell
    }
}

