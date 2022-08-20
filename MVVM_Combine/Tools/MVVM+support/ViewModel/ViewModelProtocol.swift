import Foundation

protocol ViewModelProtocol {
    associatedtype Unit: UnitProtocol = AnyUnit<Input, Output> where Unit.Input == Input, Unit.Output == Output
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

// MARK: - ViewModelProtocol + AnyViewModel

extension ViewModelProtocol {
    func asAnyViewModel() -> AnyViewModel<Input, Output> {
        AnyViewModel<Input, Output>(self)
    }
}
