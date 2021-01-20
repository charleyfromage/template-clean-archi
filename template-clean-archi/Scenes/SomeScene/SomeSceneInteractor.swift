import Foundation

typealias SomeSceneInteractorInterface = SomeSceneInteractorInputs & SomeSceneInteractorOutputs

protocol SomeSceneInteractorInputs: class {
    func initialize()
    func fetchSmthg()
}

protocol SomeSceneInteractorOutputs: class {
    var didFetchSmthg: ((Int) -> Void)? { get set }
    var loadingStateChanged: ((Bool) -> Void)? { get set }
}

final class SomeSceneInteractor: SomeSceneInteractorInterface {
    internal var didLoad: (() -> Void)?
    internal var didFetchSmthg: ((Int) -> Void)?
    internal var loadingStateChanged: ((Bool) -> Void)?

    private var isLoading: Bool = false {
        didSet {
            loadingStateChanged?(isLoading)
        }
    }

    internal func initialize() {
        
    }

    internal func fetchSmthg() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.isLoading = false
            self?.didFetchSmthg?(Int.random(in: 1..<7))
        }
    }
}
