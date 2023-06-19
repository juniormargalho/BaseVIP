//
//  LoginPresenter.swift
//  BaseVIP
//
//  Created by Junior Margalho on 19/06/23.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func didSuccessLogin(_ model: LoginResponseModel)
    func didFailureLogin(_ message: String)
}

final class LoginPresenter: LoginPresenterProtocol {
    weak var viewController: LoginViewControllerProtocol?
    
    func didSuccessLogin(_ model: LoginResponseModel) {
        let title = "Sucesso"
        let buttonTitle = "OK"
        let message = "Bem vindo \(model.firstName) \(model.lastName)!"
        let model = LoginViewModel(titleAlertMessage: title, titleAlertButton: buttonTitle, alertMessage: message)
        viewController?.showAlert(model)
    }
    
    func didFailureLogin(_ message: String) {
        let title = "Falha"
        let buttonTitle = "OK"
        let message = "Erro: \(message)!"
        let model = LoginViewModel(titleAlertMessage: title, titleAlertButton: buttonTitle, alertMessage: message)
        viewController?.showAlert(model)
    }
}
