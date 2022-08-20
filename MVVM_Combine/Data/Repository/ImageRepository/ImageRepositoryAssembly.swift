import Foundation

final class ImageRepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ImageRepositoryProtocol.self) { _ in
            ImageRepository()
        }
    }
}
