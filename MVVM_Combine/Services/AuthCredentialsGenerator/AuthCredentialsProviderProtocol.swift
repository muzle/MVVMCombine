import Foundation
import Combine

protocol AuthCredentialsProviderProtocol {
    func credentials() -> AnyPublisher<String, Never>
    func smsCredentials() -> AnyPublisher<String, Never>
    
    func login() -> String
    func password() -> String
    func smsCode() -> String
}
