//
//  LoginFactory.swift
//  BaseVIP
//
//  Created by Junior Margalho on 19/06/23.
//

import UIKit

struct LoginFactory {
    static func make() -> UIViewController {
        let worker = LoginWorker()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor(worker: worker, presenter: presenter)
        let viewController = LoginViewController(interactor: interactor)
        
        presenter.view = viewController
        
        return viewController
    }
}
