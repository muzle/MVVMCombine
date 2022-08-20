import Foundation

protocol UnitProtocol {
    associatedtype Event = Never
    associatedtype Input
    associatedtype Output
}

// MARK: - UnitProtocol

extension UnitProtocol {
    typealias ViewModel = AnyViewModel<Input, Output>
    typealias EventTracker = AnyEventTracker<Event>
}
