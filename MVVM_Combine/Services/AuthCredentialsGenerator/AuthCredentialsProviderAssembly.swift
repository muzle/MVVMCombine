import Foundation

final class AuthCredentialsProviderAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AuthCredentialsProviderProtocol.self) { _ in
            AuthCredentialsProvider(
                login: "mister",
                password: "0000",
                smsCode: "0000"
            )
        }
    }
}
