//
//  ListProductsController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 20.10.2020.
//

import UIKit

class ListProductsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOrders = [Orders]()
    var currentArrayOrders = [Orders]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
    
    
    func setUpOrders() {
    
       // MARK: - Pizza
        
        arrayOrders.append(Orders(orderName: "Napolitana", orderTime: "20-10-2020", orderStatus: .ready, orderImage: "0"))
        arrayOrders.append(Orders(orderName: "Pepperoni", orderTime: "20-10-2020", orderStatus: .ready, orderImage: "1"))
        arrayOrders.append(Orders(orderName: "Carbonara", orderTime: "22-12-2020", orderStatus: .ready, orderImage: "2"))
        arrayOrders.append(Orders(orderName: "Margherita", orderTime: "12-12-2020", orderStatus: .ready, orderImage: "3"))
    

        // MARK: - Burger
        
        arrayOrders.append(Orders(orderName: "Chesseburger", orderTime: "19-10-2020", orderStatus: .ready, orderImage: "4"))
        arrayOrders.append(Orders(orderName: "Bacon Burger", orderTime: "12-12-2020", orderStatus: .ready, orderImage: "5"))
        arrayOrders.append(Orders(orderName: "Ham Burger", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "6"))
        arrayOrders.append(Orders(orderName: "Classic Burger", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "7"))
        arrayOrders.append(Orders(orderName: "Big Mac", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "8"))
        
        // MARK: - Drinks
        
        arrayOrders.append(Orders(orderName: "Tea", orderTime: "19-10-2020", orderStatus: .ready, orderImage: "9"))
        arrayOrders.append(Orders(orderName: "Mohito", orderTime: "12-12-2020", orderStatus: .ready, orderImage: "10"))
        arrayOrders.append(Orders(orderName: "Sprite", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "11"))
        arrayOrders.append(Orders(orderName: "Milk", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "12"))
        arrayOrders.append(Orders(orderName: "Beer", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "16"))
        arrayOrders.append(Orders(orderName: "Water", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "14"))
        arrayOrders.append(Orders(orderName: "Ice Latte", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "15"))
        arrayOrders.append(Orders(orderName: "Coca-Cola", orderTime: "21-12-2020", orderStatus: .ready, orderImage: "17"))
        
        
        
        
        currentArrayOrders = arrayOrders
    }
    
    func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        setUpOrders()
        setUpSearchBar()

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArrayOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCells else {
            return UITableViewCell()
    
        }
        
        let order = currentArrayOrders[indexPath.row]
        
        cell.orderNameLabel.text = order.orderName
        cell.dateTimeLabel.text = order.orderName
        cell.statusLabel.text = order.orderStatus.rawValue
        cell.statusLabel.textColor = order.orderStatus.textColor
        cell.imageInCell.image = UIImage(named: order.orderImage)
        cell.orderNameLabel.text = order.orderName
        return cell
    }
    
    @IBAction func addCell() {
        let alert = UIAlertController(title: "Create Order", message: nil, preferredStyle: .alert)
        alert.addTextField{ (arrayOrdersTextField) in
            arrayOrdersTextField.placeholder = "Enter order"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let order = alert.textFields?.first?.text else { return }
            print(order)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    // MARK: - DELETE SWIPE
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            currentArrayOrders.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Search Bar

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        currentArrayOrders = arrayOrders.filter({ order -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty { return true }
                return order.orderName.lowercased().contains(searchText.lowercased())
            case 1:
                if searchText.isEmpty { return order.orderStatus == .ready }
                return order.orderName.lowercased().contains(searchText.lowercased()) &&
                    order.orderStatus == .ready
            case 2:
                if searchText.isEmpty { return order.orderStatus == .notready }
                return order.orderName.lowercased().contains(searchText.lowercased()) &&
                    order.orderStatus == .notready
            default:
                return false
            }
        })
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            currentArrayOrders = arrayOrders
        case 1:
            currentArrayOrders = arrayOrders.filter({ order -> Bool in
                order.orderStatus == .notready
            })
        case 2:
            currentArrayOrders = arrayOrders.filter({ order -> Bool in
                order.orderStatus == .ready
            })
        default:
            break
        }
        tableView.reloadData()
    }
}


class Orders {
    let orderName: String
    let orderTime: String
    let orderStatus: Status
    let orderImage: String
    
    init(orderName: String, orderTime: String, orderStatus: Status, orderImage: String) {
        self.orderName = orderName
        self.orderTime = orderTime
        self.orderStatus = orderStatus
        self.orderImage = orderImage
    }
}

enum Status: String {
    case ready = "Ready"
    case notready = "Not ready"
    
    var textColor: UIColor {
        switch self {
        case .ready:
            return .systemGreen
        case .notready:
            return .red
        }
    }
}
