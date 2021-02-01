//
//  ProductTableViewController.swift
//  A2_FA_iOS_Gagandeep_C0764922
//
//  Created by Gagandeep on 1/31/21.
//

import UIKit
import CoreData

class ProductTableViewController: UITableViewController,UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    let context =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var products : [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
        
    }
    func getProducts(){
        products = []
        products = try! context.fetch(Product.fetchRequest())
        insertProucts()
        tableView.reloadData()
    }
    func insertProucts(){
        if products.count == 0{
            let provider1 = Provider(context: context)
            provider1.provider = "Tata"
            
            let p11 = Product(context: context)
            p11.productDesc = "salty"
            p11.productID = "001"
            p11.productName = "salt"
            p11.productPrice = "100"
            p11.provider = provider1
            
            let p12 = Product(context: context)
            p12.productDesc = "skyyy"
            p12.productID = "002"
            p12.productName = "sky"
            p12.productPrice = "300"
            p12.provider = provider1
            
            let p13 = Product(context: context)
            p13.productDesc = "p1dis"
            p13.productID = "003"
            p13.productName = "bulb"
            p13.productPrice = "400"
            p13.provider = provider1
            
            let provider2 = Provider(context: context)
            provider2.provider = "Suzuki"
            
            let p21 = Product(context: context)
            p21.productDesc = "p1dis"
            p21.productID = "001"
            p21.productName = "bike"
            p21.productPrice = "100"
            p21.provider = provider2
            
            let p22 = Product(context: context)
            p22.productDesc = "p1dis"
            p22.productID = "002"
            p22.productName = "car"
            p22.productPrice = "300"
            p22.provider = provider2
            
            let p23 = Product(context: context)
            p23.productDesc = "p1dis"
            p23.productID = "003"
            p23.productName = "plan"
            p23.productPrice = "400"
            p23.provider = provider2
            
            let provider3 = Provider(context: context)
            provider3.provider = "BMW"
            
            let p31 = Product(context: context)
            p31.productDesc = "p1dis"
            p31.productID = "001"
            p31.productName = "bike"
            p31.productPrice = "100"
            p31.provider = provider3
            
            let p32 = Product(context: context)
            p32.productDesc = "p1dis"
            p32.productID = "002"
            p32.productName = "car"
            p32.productPrice = "300"
            p32.provider = provider3
            
            let p33 = Product(context: context)
           p33.productDesc = "p1dis"
           p33.productID = "003"
           p33.productName = "plane"
           p33.productPrice = "400"
           p33.provider = provider3
            
            let p34 = Product(context: context)
            p34.productDesc = "p1dis"
            p34.productID = "001"
            p34.productName = "Helicopter"
            p34.productPrice = "100"
            p34.provider = provider3
            try! context.save()
            getProducts()
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return products.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
            cell.textLabel?.text =
                products[indexPath.row].productName
            cell.detailTextLabel?.text = products[indexPath.row].provider?.provider
       
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            var predicate: NSPredicate = NSPredicate()
            predicate = NSPredicate(format: "productName contains[c] '\(searchText)' || productDesc contains[c] '\(searchText)'")
            let fetchRequest : NSFetchRequest<Product> = Product.fetchRequest()
            fetchRequest.predicate = predicate
            do {
                products = try context.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error)")
            }
        }
        else{
            getProducts()
            
        }
        tableView.reloadData()
    }
}
