import Foundation

protocol ViewModelBindableProtocol {
    associatedtype ViewModel
    func bind(viewModel: ViewModel)
}
