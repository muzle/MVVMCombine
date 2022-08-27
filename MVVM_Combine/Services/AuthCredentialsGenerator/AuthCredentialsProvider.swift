import Foundation
import Combine

final class AuthCredentialsProvider {
    
    // MARK: - Private properties
    
    private let login_: String
    private let password_: String
    private let smsCode_: String
    
    // MARK: - Inititalization
    
    init(
        login: String,
        password: String,
        smsCode: String
    ) {
        self.login_ = login
        self.password_ = password
        self.smsCode_ = smsCode
    }
}

// MARK: - Implement AuthCredentialsProviderProtocol

extension AuthCredentialsProvider: AuthCredentialsProviderProtocol {
    func credentials() -> AnyPublisher<String, Never> {
        let message = "Login: \(login()), password: \(password())"
        return Just(message).eraseToAnyPublisher()
    }
    
    func smsCredentials() -> AnyPublisher<String, Never> {
        let message = "SMS code: \(smsCode())"
        return Just(message).eraseToAnyPublisher()
    }
    
    func login() -> String {
        login_
    }
    
    func password() -> String {
        password_
    }
    
    func smsCode() -> String {
        smsCode_
    }
}
