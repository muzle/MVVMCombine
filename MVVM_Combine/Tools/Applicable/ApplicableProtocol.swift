import Foundation

protocol ApplicableProtocol { }

extension ApplicableProtocol {
    @discardableResult
    func apply(closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

// MARK: - NSObject + ApplicableProtocol

extension NSObject: ApplicableProtocol { }
