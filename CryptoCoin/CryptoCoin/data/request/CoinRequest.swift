//
//  CoinRequest.swift
//  CryptoCoin
//
//  Created by Luiza Negreiros Naves - LNA on 05/05/21.
//

import Foundation

enum CoinError: Error {
    case noDataAvaliable
    case canNotProcessData
    
}

struct CoinRequest {
    let resourceURL: URL
    let API_HEADER = "X-CMC_PRO_API_KEY"
    let API_KEY = "7d40fdff-190e-424b-90bf-37c7ee6e696a"
    
    init(CoinCode: String) {
        let resourceString = "https://pro-api.coinmarketcap.com/cryptocurrency/listings/latest?\(API_HEADER)=\(API_KEY)"
        guard let responseURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = responseURL
    }
    
    func getCoins (completion: @escaping(Result<[DataCoin], CoinError>) -> Void){
        let coinTask = URLSession.shared.dataTask(with: resourceURL){
            datas,_,_ in
            guard let jsonData = datas else {
                completion(.failure(.noDataAvaliable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let coinResponse = try decoder.decode(Coin.self, from: jsonData)
                let coinDetails = coinResponse.data
                completion(.success(coinDetails))
            }
            catch {
                completion(.failure(.canNotProcessData))
            }
        }
        coinTask.resume()
    }
}
