import Foundation
import Combine

final class AuthRepository {
    
    // MARK: - Private properties
    
    private let generator: AuthCredentialsProviderProtocol
    private let tokenRepository: SingleObjectRepository<String>
    private let profileRepository: SingleObjectRepository<Profile>
    
    // MARK: - Initialization
    
    init(
        generator: AuthCredentialsProviderProtocol,
        tokenRepository: SingleObjectRepository<String>,
        profileRepository: SingleObjectRepository<Profile>
    ) {
        self.generator = generator
        self.tokenRepository = tokenRepository
        self.profileRepository = profileRepository
    }
}

// MARK: - Implement AuthRepositoryProtocol

extension AuthRepository: AuthRepositoryProtocol {
    func signIn(login: String, password: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { future in
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [self] in
                    guard login == generator.login(), password == generator.password() else {
                        future(.failure(AuthRepositoryError.invalidParameters))
                        return
                    }
                    future(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func confirm(code: String) -> AnyPublisher<Profile, Error> {
        Deferred {
            Future { future in
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [self] in
                    future(mockConfirm(code: code))
                }
            }
        }
        .flatMap(storeProfile(dtoProfile:))
        .eraseToAnyPublisher()
    }
}

// MARK: - Private methods

private extension AuthRepository {
    func mockConfirm(code: String) -> Result<ProfileDTO, Error> {
        guard code == generator.smsCode() else { return .failure(AuthRepositoryError.invalidSms) }
        let profile = ProfileDTO(token: "token", name: "Jack", sName: "Tayler")
        return .success(profile)
    }
    
    func castToDomainProfile(dtoProfile: ProfileDTO) -> Profile {
        Profile(name: dtoProfile.name, sName: dtoProfile.sName)
    }
    
    func storeProfile(dtoProfile: ProfileDTO) -> AnyPublisher<Profile, Error> {
        Publishers
            .CombineLatest(
                tokenRepository.save(value: dtoProfile.token),
                profileRepository.save(value: castToDomainProfile(dtoProfile: dtoProfile))
            )
            .map { $0.1 }
            .eraseToAnyPublisher()
    }
}

// MARK: - AuthRepositoryError

private extension AuthRepository {
    enum AuthRepositoryError: Error {
        case invalidParameters, invalidSms
    }
}
