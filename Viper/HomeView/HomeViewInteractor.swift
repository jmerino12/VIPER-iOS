//
//  HomeViewInteractor.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/12/22.
//  
//

import Foundation

class HomeViewInteractor: HomeViewInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeViewInteractorOutputProtocol?
    var localDatamanager: HomeViewLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeViewRemoteDataManagerInputProtocol?
    
    func getData() {
        remoteDatamanager?.getPost()
    }

}

extension HomeViewInteractor: HomeViewRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallbackData(with post: [Post]) {
        presenter?.interactorPushDataPresenter(recevideData: post)
    }
    
    
}
