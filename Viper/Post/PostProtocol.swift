//
//  PostProtocol.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 7/12/22.
//

import UIKit
import Foundation

protocol ViewToPresenterProtocol: AnyObject {
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func startFetchingPost()
    func showMovieController(navigationController:UINavigationController, post: Post)
    
}

protocol PresenterToViewProtocol: AnyObject {
    func showPost(data:[Post])
    func showError()
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createModule()-> PostView
    func pushToDetailScreen(navigationConroller:UINavigationController, post: Post)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchPost()
}

protocol InteractorToPresenterProtocol: AnyObject {
    func postFetchedSuccess(data:[Post])
    func postFetchFailed()
}
