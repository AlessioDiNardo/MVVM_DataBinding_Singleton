//
//  ProductListViewController.swift
//  MVVM_DataBinding_Singleton
//
//  Created by Alessio Di Nardo on 09/01/23.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
}

extension ProductListViewController {
    
    func configuration() {
        productTableView.register(UINib(nibName: "ProductsCell", bundle: nil), forCellReuseIdentifier: "ProductsCell")
        productTableView.dataSource = self
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            
            switch event {
            case .loading: break
            case .stopLoading: break
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }

}

extension ProductListViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell") as? ProductsCell else { return UITableViewCell() }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
}
