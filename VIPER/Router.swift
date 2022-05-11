//
//  Router.swift
//  DI
//
//  Created by 朱彦谕 on 2022/5/11.
//

import Foundation
import UIKit


typealias EntryPoint =  AnyView & UIViewController
// object
// entry point
protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        // assign vip
        var view: AnyView = UserViewConrtroller()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPoint
        return router
    }
}
