import Foundation

final class PlaceRepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PlaceRepositoryProtocol.self) { _ in
            PlaceRepository()
        }
    }
}
