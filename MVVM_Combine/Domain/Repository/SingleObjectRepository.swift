import Foundation
import Combine

class SingleObjectRepository<T> {
    func currentValue() throws -> T? {
        preconditionFailure("\(#function) must be override")
    }
    
    func save(value: T) -> AnyPublisher<T, Error> {
        preconditionFailure("\(#function) must be override")
    }
    
    func read() -> AnyPublisher<T?, Error> {
        preconditionFailure("\(#function) must be override")
    }
    
    func clear() -> AnyPublisher<Void, Error> {
        preconditionFailure("\(#function) must be override")
    }
}
