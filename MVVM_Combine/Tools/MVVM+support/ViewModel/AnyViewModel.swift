import Foundation

final class AnyViewModel<Input, Output>: ViewModelProtocol {
    
    // MARK: - Private properties
    
    private let transformation: (Input) -> Output
    
    // MARK: - Initialization
    
    init<Model: ViewModelProtocol>(_ model: Model) where Model.Input == Input, Model.Output == Output {
        transformation = model.transform(input:)
    }
    
    // MARK: - Protocol methods
    
    func transform(input: Input) -> Output {
        transformation(input)
    }
}
