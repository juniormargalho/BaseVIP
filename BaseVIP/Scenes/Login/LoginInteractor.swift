//
//  LoginInteractor.swift
//  BaseVIP
//
//  Created by Junior Margalho on 19/06/23.
//

import Foundation

protocol LoginInteractorProtocol: AnyObject {
    func login(_ login: String,_ password: String)
}

final class LoginInteractor: LoginInteractorProtocol {
    private let worker: LoginWorkerProtocol
    private let presenter: LoginPresenterProtocol
    
    init(worker: LoginWorkerProtocol, presenter: LoginPresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func login(_ login: String,_ password: String) {
        worker.authenticate(login: login, password: password) { [weak self] result in
            switch result {
            case .success(let model):
                self?.presenter.didSuccessLogin(model)
            case .failure(let error):
                self?.presenter.didFailureLogin(error.localizedDescription)
            }
        }
    }
}
