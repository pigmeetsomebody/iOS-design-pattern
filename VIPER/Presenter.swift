//
//  Presenter.swift
//  DI
//
//  Created by 朱彦谕 on 2022/5/11.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    func interactorDidFetchUseers(with result: Result<[User], Error>)
    //var interactor:
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    
    init() {
        interactor?.getUsers()
    }
    
    func interactorDidFetchUseers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "something went wrong!")
        }
    }
    
    
}
