import Foundation
import Combine
import UIKit

final class ImageRepository: ImageRepositoryProtocol {
    
    // MARK: - Private properties
    
    private let urlSession: URLSession
    private var cash = [String: UIImage]()
    
    // MARK: - Initialization
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    // MARK: - ImageRepositoryProtocol
    
    func fetchImage(url: String) -> AnyPublisher<UIImage, Error> {
        if let image = cash[url] {
            return Just(image)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        guard let url_ = URL(string: url) else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        
        return urlSession
            .dataTaskPublisher(for: url_)
            .map { $0.data }
            .tryMap(mapToImage(data:))
            .handleEvents(receiveOutput: { [self] image in cash[url] = image })
            .eraseToAnyPublisher()
    }
}

// MARK: - Private methods

private extension ImageRepository {
    func mapToImage(data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else { throw ImageRepositoryError.invalidData }
        return image
    }
}

// MARK: - Custom errors

private extension ImageRepository {
    enum ImageRepositoryError: LocalizedError {
        case invalidData
        
        var errorDescription: String? {
            switch self {
            case .invalidData: return "invalidData"
            }
        }
    }
}
