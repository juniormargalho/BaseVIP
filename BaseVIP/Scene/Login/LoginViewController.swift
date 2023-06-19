//
//  LoginViewController.swift
//  BaseVIP
//
//  Created by Junior Margalho on 19/06/23.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject {
    func showAlert(_ model: LoginViewModel)
}

final class LoginViewController: UIViewController, LoginViewControllerProtocol {
    enum Layout {
        static let viewsHeigth: CGFloat = 24
        static let viewsHorizontalEdges: CGFloat = 16
        static let stackViewSpacing: CGFloat = 24
        static let cornerRadius: CGFloat = 4
        static let labelFontSize: CGFloat = 18
    }
    
    // MARK: UI
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = Layout.stackViewSpacing
        return stack
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Layout.labelFontSize)
        label.text = "Login"
        return label
    }()
    
    private lazy var textFieldLogin: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = "Login"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private lazy var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var buttonContinue: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Continuar", for: .normal)
        button.addTarget(self, action: #selector(handlerButtonContinue), for: .touchUpInside)
        button.layer.cornerRadius = Layout.cornerRadius
        return button
    }()
    
    // MARK: Properties
    let interactor: LoginInteractorProtocol
    
    // MARK: Initialization
    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods
    private func setupUI() {
        buildHierarchy()
        setupConstraints()
        view.backgroundColor = .lightGray
    }
    
    private func buildHierarchy() {
        view.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textFieldLogin)
        stackView.addArrangedSubview(textFieldPassword)
        stackView.addArrangedSubview(buttonContinue)
    }
    
    private func setupConstraints() {
        setupContentView()
        setupStackView()
    }
    
    private func setupContentView() {
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupStackView() {
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                           constant: Layout.viewsHorizontalEdges).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                            constant: -Layout.viewsHorizontalEdges).isActive = true
    }
    
    @objc
    private func handlerButtonContinue(_ sender: UIButton) {
        guard let login = textFieldLogin.text else { return }
        guard let password = textFieldPassword.text else { return }
        interactor.login(login, password)
    }
    
    
}

// MARK: Extension
extension LoginViewController {
    func showAlert(_ model: LoginViewModel) {
        let alert = UIAlertController(title: model.titleAlertMessage,
                                      message: model.alertMessage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: model.titleAlertButton,
                                   style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
