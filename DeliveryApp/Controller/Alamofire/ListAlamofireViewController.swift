//
//  ListAlamofireViewController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 22.11.2020.


import UIKit
import Alamofire
import AlamofireImage

class ListAlamofireViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var restaurants: [[String: Any]] = [[String: Any]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    
// MARK: - Request
    
    func request() {
        AF.request("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita").responseJSON { (response) in
            if let responseValue = response.value as! [String: Any]? {
//                print(responseValue)
                if let responseDrink = responseValue["drinks"] as! [[String: Any]]? {
                    self.restaurants = responseDrink
                    self.tableView?.reloadData()
                }
            }
        }
    }
    
}


extension ListAlamofireViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListAlamofireTableViewCell") as! ListAlamofireTableViewCell
        if self.restaurants.count > 0 {
            let eachRestaurant = self.restaurants[indexPath.row]
            cell.nameRestaurant?.text = (eachRestaurant["strDrink"] as? String) ?? ""
            cell.nameDish?.text = (eachRestaurant["strIBA"] as? String) ?? ""
            if let imageUrl = eachRestaurant["strDrinkThumb"] as? String {
                AF.request(imageUrl).responseImage(completionHandler: { (response) in
                    print(response)
                    if let image = response.value {
//                        let size = CGSize(width: 1000.0, height: 1000.0)
//                        let scaledImage = image.af.imageScaled(to: size)
                        let roundedImage = image.af.imageRounded(withCornerRadius: 50.0)
                        DispatchQueue.main.async {
                            cell.mainImage?.image = roundedImage
                        }
                    }
                })
            }
        }
        return cell
    }
}
