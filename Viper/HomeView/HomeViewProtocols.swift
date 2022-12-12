//
//  HomeViewProtocols.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/12/22.
//  
//

import Foundation
import UIKit

protocol HomeViewViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomeViewPresenterProtocol? { get set }
    func presenterPushDataView(receivedData : [Post])
    
    func loadSpinner()
    func stopSpinner()
}

protocol HomeViewWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeViewModule() -> UIViewController
    
    func navigateToDetailView(from view: HomeViewViewProtocol, withData: Post)
}

protocol HomeViewPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewViewProtocol? { get set }
    var interactor: HomeViewInteractorInputProtocol? { get set }
    var wireFrame: HomeViewWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func navigateToDetailView(with data: Post)
}

protocol HomeViewInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(recevideData: [Post])
}

protocol HomeViewInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeViewInteractorOutputProtocol? { get set }
    var localDatamanager: HomeViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeViewRemoteDataManagerInputProtocol? { get set }
    
    func getData()
}

protocol HomeViewDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeViewRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeViewRemoteDataManagerOutputProtocol? { get set }
    
    func getPost()
}

protocol HomeViewRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallbackData(with post: [Post])
}

protocol HomeViewLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
