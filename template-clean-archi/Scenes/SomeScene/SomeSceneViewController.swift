import UIKit

typealias SomeSceneViewInterface = SomeSceneViewInputs & SomeSceneViewOutputs

protocol SomeSceneViewInputs: ViewInputs {
    func updateLabelText(text: String?)
    func hideLabel(shouldHide: Bool)
    func updateActivityIndicator(shouldAnimate: Bool)
    func updateButtonTitle(title: String?)
    func disableButton(shouldEnable: Bool)
}

protocol SomeSceneViewOutputs: ViewOutputs {
    var buttonTapped: (() -> Void)? { get set }
}

final class SomeSceneViewController: ViewController, SomeSceneViewInterface {
    // MARK: Outlets
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var button: UIButton!

    // MARK: Outputs
    internal var buttonTapped: (() -> Void)?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Inputs
    /// Label
    internal func updateLabelText(text: String?) {
        label.text = text
    }

    internal func hideLabel(shouldHide: Bool) {
        label.isHidden = shouldHide
    }

    /// ActivityIndicator
    internal func updateActivityIndicator(shouldAnimate: Bool) {
        if shouldAnimate {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }

    /// Button
    internal func updateButtonTitle(title: String?) {
        button.setTitle(title, for: .normal)
    }

    internal func disableButton(shouldEnable: Bool) {
        button.isEnabled = shouldEnable
    }

    // MARK: Actions
    @IBAction func buttonTap() {
        buttonTapped?()
    }
}
