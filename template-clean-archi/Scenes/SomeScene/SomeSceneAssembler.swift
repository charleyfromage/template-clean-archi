final class SomeSceneAssembler {
    static func assemble(_ view: SomeSceneViewInterface, _ interactor: SomeSceneInteractorInterface, _ presenter: SomeScenePresenterInterface) {
        /// View outputs
        view.didLoad = { [weak interactor, weak presenter] in
            interactor?.initialize()
            presenter?.initialise()
        }
        view.buttonTapped = interactor.fetchSmthg

        /// Interactor outputs
        interactor.didFetchSmthg = presenter.formatSmthg
        interactor.loadingStateChanged = { [weak view] isLoading in
            view?.updateActivityIndicator(shouldAnimate: isLoading)
            view?.hideLabel(shouldHide: isLoading)
            view?.disableButton(shouldEnable: !isLoading)
        }

        /// Presenter outputs
        presenter.buttonTitleChanged = view.updateButtonTitle
        presenter.labelTextChanged = view.updateLabelText
    }
}
