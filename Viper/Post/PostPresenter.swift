//
//  PostPresenter.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 7/12/22.
//

import Foundation
import UIKit


class PostPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingPost() {
        interactor?.fetchPost()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToDetailScreen(navigationConroller: navigationController)
    }
    
}

extension PostPresenter: InteractorToPresenterProtocol {
    func postFetchedSuccess(data: [Post]) {
        view?.showPost(data: data)
    }
    
    func postFetchFailed() {
        view?.showError()
    }
    
    
}
