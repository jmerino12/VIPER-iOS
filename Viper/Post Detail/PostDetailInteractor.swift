//
//  PostDetailInteractor.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 11/12/22.
//  
//

import Foundation

class PostDetailInteractor: PostDetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: PostDetailInteractorOutputProtocol?
    var localDatamanager: PostDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: PostDetailRemoteDataManagerInputProtocol?

}

extension PostDetailInteractor: PostDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
