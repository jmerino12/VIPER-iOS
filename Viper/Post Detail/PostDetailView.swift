//
//  PostDetailView.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 11/12/22.
//  
//

import Foundation
import UIKit

class PostDetailView: UIViewController {

    // MARK: Properties
    var presenter: PostDetailPresenterProtocol?
    
    // MARK: - Properties UI
    let myTitle : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let myBody : UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myTitle)
        view.addSubview(myBody)
        presenter?.viewDidLoad()
        
        myTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        myBody.centerYAnchor.constraint(equalTo: myTitle.centerYAnchor, constant: 50).isActive = true
        myBody.centerXAnchor.constraint(equalTo: myTitle.centerXAnchor).isActive = true
        
        myBody.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        myTitle.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
       
    }
}

extension PostDetailView: PostDetailViewProtocol {
    // TODO: implement view output methods
    func showData(data: Post) {
        myTitle.text = data.title
        myBody.text = data.body
    }
}
