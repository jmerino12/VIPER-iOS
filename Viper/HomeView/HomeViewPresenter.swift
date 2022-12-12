//
//  HomeViewPresenter.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/12/22.
//  
//

import Foundation

class HomeViewPresenter  {
    
    // MARK: Properties
    weak var view: HomeViewViewProtocol?
    var interactor: HomeViewInteractorInputProtocol?
    var wireFrame: HomeViewWireFrameProtocol?
    
}

extension HomeViewPresenter: HomeViewPresenterProtocol {
    
    // TODO: implement presenter methods
    
    func viewDidLoad() {
        view?.loadSpinner()
        interactor?.getData()
    }
    
    func navigateToDetailView(with data: Post) {
        wireFrame?.navigateToDetailView(from: view!, withData: data)
    }
    

}

extension HomeViewPresenter: HomeViewInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func interactorPushDataPresenter(recevideData: [Post]) {
        view?.stopSpinner()
        view?.presenterPushDataView(receivedData: recevideData)
    }
}
