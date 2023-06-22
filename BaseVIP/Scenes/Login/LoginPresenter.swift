//
//  LoginPresenter.swift
//  BaseVIP
//
//  Created by Junior Margalho on 19/06/23.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func didSuccessLogin(_ model: LoginResponseModel)
    func didFailureLogin(_ message: Error)
}

final class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewControllerProtocol?
    
    func didSuccessLogin(_ model: LoginResponseModel) {
        let title = "Sucesso"
        let buttonTitle = "OK"
        let message = "Bem vindo \(model.firstName) \(model.lastName)!"
        let model = LoginViewModel(titleAlertMessage: title, titleAlertButton: buttonTitle, alertMessage: message)
        view?.showAlert(model)
    }
    
    func didFailureLogin(_ message: Error) {
        let title = "Falha"
        let buttonTitle = "OK"
        let message = "Erro: \(message.localizedDescription)!"
        let model = LoginViewModel(titleAlertMessage: title, titleAlertButton: buttonTitle, alertMessage: message)
        view?.showAlert(model)
    }
}
