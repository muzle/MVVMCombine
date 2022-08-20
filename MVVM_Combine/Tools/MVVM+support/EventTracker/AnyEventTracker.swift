import Foundation

final class AnyEventTracker<Event>: EventTrackerProtocol {
    
    // MARK: - Private properties
    
    private let completion: (Event) -> Void
    
    // MARK: - Initialization
    
    init(_ completion: @escaping (Event) -> Void) {
        self.completion = completion
    }
    
    init<EventTracker: EventTrackerProtocol>(_ router: EventTracker) where EventTracker.Event == Event {
        completion = router.handle(event:)
    }
    
    // MARK: - Protocol methods
    
    func handle(event: Event) {
        completion(event)
    }
}

// MARK: - EventTrackerProtocol + AnyEventTracker

extension EventTrackerProtocol {
    func asAnyEventTracker() -> AnyEventTracker<Event> {
        AnyEventTracker<Event>(self)
    }
}
