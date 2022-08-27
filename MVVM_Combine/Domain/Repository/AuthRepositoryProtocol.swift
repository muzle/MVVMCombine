import Foundation
import Combine

protocol AuthRepositoryProtocol {
    func signIn(login: String, password: String) -> AnyPublisher<Void, Error>
    func confirm(code: String) -> AnyPublisher<Profile, Error>
}
