//
//  PostRouter.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 7/12/22.
//

import Foundation
import UIKit

class PostRouter: PresenterToRouterProtocol {
    
    static func createModule() -> PostView {
        
        let view = PostView()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = PostPresenter()
        let interactor: PresenterToInteractorProtocol = PostInteractor()
        let router:PresenterToRouterProtocol = PostRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
        
    }
    
    func pushToDetailScreen(navigationConroller: UINavigationController, post: Post) {
        //let movieModue = PostDetailWireFrame.createPostDetailModule(post: post)
        //navigationConroller.pushViewController(movieModue, animated: true)
    }
    
}
