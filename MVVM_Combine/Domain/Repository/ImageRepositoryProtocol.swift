import Foundation
import Combine
import UIKit

protocol ImageRepositoryProtocol {
    func fetchImage(url: String) -> AnyPublisher<UIImage, Error>
}
