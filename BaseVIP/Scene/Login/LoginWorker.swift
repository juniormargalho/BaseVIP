//
//  LoginWorker.swift
//  BaseVIP
//
//  Created by Junior Margalho on 19/06/23.
//

import Foundation

protocol LoginWorkerProtocol: AnyObject {
    func authenticate(login: String,
                      password: String,
                      completion: @escaping (Result<LoginResponseModel, Error>) -> Void)
}

final class LoginWorker: LoginWorkerProtocol {
    func authenticate(login: String,
                      password: String,
                      completion: @escaping (Result<LoginResponseModel, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if login == "login" && password == "123456" {
                let model = LoginResponseModel(firstName: "Junior", lastName: "Margalho")
                completion(.success(model))
            } else {
                let authenticationError = NSError(domain: "Erro de autenticação", code: 400, userInfo: nil)
                completion(.failure(authenticationError))
            }
        }
    }
}
