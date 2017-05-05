//
//  Service.swift
//  Twitter-Clone
//
//  Created by r3d on 05/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {

    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")

    static let sharedInstance = Service()

    func fetchHomeFeed(completion: @escaping (HomeDataSource) -> ()) {
        print("Fetching home feed")

        let request: APIRequest<HomeDataSource, JSONError> = tron.request("/twitter/home")

        request.perform(withSuccess: { (homeDatasource) in
            print("Sucessfully fetched our json objects")
            completion(homeDatasource)
        }) { (err) in
            print("Failed to fetch json...", err)
        }
        print(2)
    }

    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }

}
