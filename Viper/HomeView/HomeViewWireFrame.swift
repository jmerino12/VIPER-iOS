//
//  HomeViewWireFrame.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/12/22.
//  
//

import Foundation
import UIKit

class HomeViewWireFrame: HomeViewWireFrameProtocol {
    
    class func createHomeViewModule() -> UIViewController {

        let view = HomeViewView()
        
        let presenter: HomeViewPresenterProtocol & HomeViewInteractorOutputProtocol = HomeViewPresenter()
        let interactor: HomeViewInteractorInputProtocol & HomeViewRemoteDataManagerOutputProtocol = HomeViewInteractor()
        let localDataManager: HomeViewLocalDataManagerInputProtocol = HomeViewLocalDataManager()
        let remoteDataManager: HomeViewRemoteDataManagerInputProtocol = HomeViewRemoteDataManager()
        let wireFrame: HomeViewWireFrameProtocol = HomeViewWireFrame()
            
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
            
        return view
    }
    
    func navigateToDetailView(from view: HomeViewViewProtocol, withData: Post) {
        let detailView = PostDetailWireFrame.createPostDetailModule(with: withData)
        
        if let view = view as? UIViewController {
            view.navigationController?.pushViewController(detailView, animated: true)
        }
        
    }
 
}
