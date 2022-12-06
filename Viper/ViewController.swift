//
//  ViewController.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 6/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    private var datos = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTable.delegate = self
        myTable.dataSource = self
        let capaConexion =  ExternalDataManager(delegate: self)
        capaConexion.getPost()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(String(describing: self.datos[indexPath.row].title))"
        return cell
    }
    
}

extension ViewController: ExternalDataSource {
    func getDataFromServer(datos: [Post]) {
        self.datos = datos
        DispatchQueue.main.async {
            self.myTable.reloadData()
        }
    }
}

