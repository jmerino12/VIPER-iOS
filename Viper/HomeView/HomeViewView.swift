//
//  HomeViewView.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/12/22.
//  
//

import Foundation
import UIKit

class HomeViewView: UIViewController {

    // MARK: Properties
    var presenter: HomeViewPresenterProtocol?
    var postList:[Post] = [Post]()
    // MARK: - UI
    
    let myTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        return table
    }()
    
    let loadingSpinner: UIActivityIndicatorView = {
        let loadingSpinner = UIActivityIndicatorView(style: .large)
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.hidesWhenStopped = true
        return loadingSpinner
    }()

    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Comunico a mi vista con el presenter
        view.addSubview(myTable)
        
        myTable.delegate = self
        myTable.dataSource = self
        
        let topContraint = NSLayoutConstraint(item: myTable, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        let bottomContraint = NSLayoutConstraint(item: myTable, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        let leadingContraint = NSLayoutConstraint(item: myTable, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let trailingContraint = NSLayoutConstraint(item: myTable, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topContraint, bottomContraint, leadingContraint, trailingContraint])
        
        view.addSubview(loadingSpinner)
        loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        presenter?.viewDidLoad()
    }
}

extension HomeViewView: HomeViewViewProtocol {

    
    // TODO: implement view output methods
    
    func presenterPushDataView(receivedData: [Post]) {
        DispatchQueue.main.async {
            self.postList = receivedData
            self.myTable.reloadData()
        }
    }
    
    func loadSpinner() {
        DispatchQueue.main.async {
            self.loadingSpinner.startAnimating()
        }
    }
    
    func stopSpinner() {
        DispatchQueue.main.async {
            self.loadingSpinner.stopAnimating()
            self.loadingSpinner.hidesWhenStopped = true
        }
        
    }
    
    
}

extension HomeViewView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.textLabel?.font = .systemFont(ofSize: 20)
            cell?.accessoryType = .disclosureIndicator
            cell?.selectionStyle = .none
        }
        cell!.textLabel?.text = postList[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.navigateToDetailView(with: postList[indexPath.row])
    }
    
    
}
