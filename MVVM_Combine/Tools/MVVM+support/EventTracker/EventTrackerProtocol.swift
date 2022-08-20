import Foundation

protocol EventTrackerProtocol {
    associatedtype Event
    func handle(event: Event)
}
