//
//  PostDetailWireFrame.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 11/12/22.
//  
//

import Foundation
import UIKit

class PostDetailWireFrame: PostDetailWireFrameProtocol {

    class func createPostDetailModule(with data:Post) -> UIViewController {

        let view = PostDetailView()
        let presenter: PostDetailPresenterProtocol & PostDetailInteractorOutputProtocol = PostDetailPresenter()
        let interactor: PostDetailInteractorInputProtocol & PostDetailRemoteDataManagerOutputProtocol = PostDetailInteractor()
        let localDataManager: PostDetailLocalDataManagerInputProtocol = PostDetailLocalDataManager()
        let remoteDataManager: PostDetailRemoteDataManagerInputProtocol = PostDetailRemoteDataManager()
        let wireFrame: PostDetailWireFrameProtocol = PostDetailWireFrame()
            
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        presenter.data = data
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
            
        return view
    }
 
}
