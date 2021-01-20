typealias SomeScenePresenterInterface = SomeScenePresenterInputs & SomeScenePresenterOutputs

protocol SomeScenePresenterInputs: class {
    func initialise()
    func formatSmthg(value: Int)
}

protocol SomeScenePresenterOutputs: class {
    var buttonTitleChanged: ((String?) -> Void)? { get set }
    var labelTextChanged: ((String?) -> Void)? { get set }
}

final class SomeScenePresenter: SomeScenePresenterInterface {
    var buttonTitleChanged: ((String?) -> Void)?
    var labelTextChanged: ((String?) -> Void)?

    internal func initialise() {
        buttonTitleChanged?("Roll the dice")
    }

    internal func formatSmthg(value: Int) {
        labelTextChanged?("\(value)")
    }
}
