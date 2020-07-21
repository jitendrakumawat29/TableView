//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Jitendra Kumar on 21/07/20.
//  Copyright © 2020 Jitendra Kumar. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    // MARK: Class Properties
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let cellId = "cellId"
    private let refreshControl = UIRefreshControl()

    // MARK: View Controller Cycle
    override func loadView() {
      super.loadView()
      view.backgroundColor = .white
      self.safeArea = view.layoutMarginsGuide
      self.setupTableView()
    }
    
    // Add table view and it's Constraints to main view
    func setupTableView() {
       if #available(iOS 11.0, *) {
        IndicatorView.shared.showProgressView()
       } else {
            // Fallback on earlier versions
       }
      // call the api to fetch all the products from server
        
      self.tableView.isHidden = true
      self.tableView.dataSource = self
      self.tableView.delegate = self
      
      self.tableView.rowHeight = UITableView.automaticDimension
      self.tableView.estimatedRowHeight = 100
      self.tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)

      // Set table view constraint
      view.addSubview(self.tableView)
      self.tableView.translatesAutoresizingMaskIntoConstraints = false
      self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
      // add pull to refresh to tableview and add target action
      self.tableView.addSubview(refreshControl)
      self.refreshControl.tintColor = UIColor.blue
      let string = "Fetching Product Data.."
      let stringAttribute = [NSAttributedString.Key.foregroundColor: UIColor.blue]
      let atributeString = NSAttributedString(string: string, attributes: stringAttribute)
      self.refreshControl.attributedTitle = atributeString
      self.refreshControl.addTarget(self, action: #selector(refreshProductData(_:)), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set navigation bar title and tint color
        self.navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    @objc private func refreshProductData(_ sender: Any) {
        // call the api to fetch all the latest products from server
    }
}

// MARK: Table view delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
      cell.selectionStyle = .none
    
      return cell
  }
  
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }

}



