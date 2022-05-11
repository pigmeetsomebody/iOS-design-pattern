//
//  Interactor.swift
//  DI
//
//  Created by 朱彦谕 on 2022/5/11.
//

import Foundation

// object
// protocol
// ref to presenter

enum FetchError: Error {
    case error
}

protocol AnyInteractor {
    //var router: AnyRouter? { get set }
    //var interactor:
    var presenter: AnyPresenter? { get set}
    func getUsers()
}

class UserInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self.presenter?.interactorDidFetchUseers(with: .success(entities))
            } catch {
                self.presenter?.interactorDidFetchUseers(with: .failure(error))
            }
        }
        task.resume()
    }
}
