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

class PostView: UIViewController {
    
    var presentor:ViewToPresenterProtocol?
    var noticeArrayList:[Post] = [Post]()
    
    let myTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTable)
        
        myTable.delegate = self
        myTable.dataSource = self
        
        let topContraint = NSLayoutConstraint(item: myTable, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        let bottomContraint = NSLayoutConstraint(item: myTable, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        let leadingContraint = NSLayoutConstraint(item: myTable, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let trailingContraint = NSLayoutConstraint(item: myTable, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topContraint, bottomContraint, leadingContraint, trailingContraint])
        
        presentor?.startFetchingPost()

    }
    
}

extension PostView: PresenterToViewProtocol{
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
            self.myTable.layoutIfNeeded()
        }
        
    }
    
    
}


extension PostView: UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentor?.showMovieController(navigationController: navigationController!, post: noticeArrayList[indexPath.row])
    }
    
    
}
