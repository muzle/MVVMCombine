import Foundation
import Combine

protocol PlaceRepositoryProtocol {
    func fetchPlaces() -> AnyPublisher<[Place], Error>
}
