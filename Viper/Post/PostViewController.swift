//
//  HomeViewController.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 7/12/22.
//

import UIKit

/* Show Progress Indicator */
func showProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = false
    
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: "Please wait..")
    progressIndicator.tag = 10
    view.addSubview(progressIndicator)
    
}

/* Hide progress Indicator */
func hideProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(10) {
        viewWithTag.removeFromSuperview()
    }
    
}

class PostViewController: UIViewController {
    
    var presentor:ViewToPresenterProtocol?
    var noticeArrayList:[Post] = [Post]()
    
    let myTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.backgroundColor = .white
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTable)
        
        myTable.delegate = self
        myTable.dataSource = self
        
        myTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        presentor?.startFetchingPost()
    }
    
}

extension PostViewController: PresenterToViewProtocol{
    func showError() {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Post", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showPost(data: [Post]) {
        hideProgressIndicator(view: self.view)
        self.noticeArrayList = data
        DispatchQueue.main.async {
            self.myTable.reloadData()
        }
        
    }
    
    
}


extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.textLabel?.font = .systemFont(ofSize: 20)
            cell?.accessoryType = .disclosureIndicator
            cell?.selectionStyle = .none
        }
        cell!.textLabel?.text = noticeArrayList[indexPath.row].title
        return cell!
    }
    
    
}
