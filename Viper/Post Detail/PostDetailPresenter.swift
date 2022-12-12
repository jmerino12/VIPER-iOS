//
//  PostDetailPresenter.swift
//  Viper
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 11/12/22.
//  
//

import Foundation

class PostDetailPresenter: PostDetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: PostDetailViewProtocol?
    var interactor: PostDetailInteractorInputProtocol?
    var wireFrame: PostDetailWireFrameProtocol?
    var data: Post?
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        if let dato = data {
            view?.showData(data: dato)
        }
    }
    
}


extension PostDetailPresenter: PostDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
