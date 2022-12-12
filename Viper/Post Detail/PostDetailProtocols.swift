//
//  PostDetailProtocols.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 11/12/22.
//  
//

import Foundation
import UIKit

protocol PostDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: PostDetailPresenterProtocol? { get set }
    
    func showData(data: Post)
}

protocol PostDetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createPostDetailModule(with data:Post) -> UIViewController
}

protocol PostDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: PostDetailViewProtocol? { get set }
    var interactor: PostDetailInteractorInputProtocol? { get set }
    var wireFrame: PostDetailWireFrameProtocol? { get set }
    var data: Post? {get set}
    
    func viewDidLoad()
}

protocol PostDetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol PostDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: PostDetailInteractorOutputProtocol? { get set }
    var localDatamanager: PostDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PostDetailRemoteDataManagerInputProtocol? { get set }
}

protocol PostDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol PostDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: PostDetailRemoteDataManagerOutputProtocol? { get set }
}

protocol PostDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol PostDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
