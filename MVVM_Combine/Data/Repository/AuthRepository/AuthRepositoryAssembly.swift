import Foundation

final class AuthRepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AuthRepositoryProtocol.self) { resolver in
            let generator = resolver.resolve(AuthCredentialsProviderProtocol.self)!
            let tokenRepository = resolver.resolve(SingleObjectRepository<String>.self)!
            let profileRepository = resolver.resolve(SingleObjectRepository<Profile>.self)!
            
            return AuthRepository(
                generator: generator,
                tokenRepository: tokenRepository,
                profileRepository: profileRepository
            )
        }
    }
}
