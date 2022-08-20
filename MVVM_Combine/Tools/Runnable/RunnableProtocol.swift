import Foundation

protocol RunnableProtocol { }

extension RunnableProtocol {
    @discardableResult
    func run<T>(closure: (Self) -> T) -> T {
        return closure(self)
    }
}

// MARK: - NSObject + RunnableProtocol

extension NSObject: RunnableProtocol { }
