//
//  PostRouter.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 7/12/22.
//

import Foundation
import UIKit

class PostRouter: PresenterToRouterProtocol {
    static func createModule() -> PostViewController {
        let view = PostViewController()
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
    
    func pushToDetailScreen(navigationConroller: UINavigationController) {
        let movieModue = PostRouter.createModule()
        navigationConroller.pushViewController(movieModue, animated: true)
    }
    
}
