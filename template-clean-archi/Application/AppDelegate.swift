import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let storyboard = UIStoryboard(name: "SomeSceneView", bundle:nil)
        if let someSceneViewController = storyboard.instantiateViewController(withIdentifier: "SomeSceneViewController") as? SomeSceneViewController {
            let someSceneInteractor = SomeSceneInteractor()
            let someScenePresenter = SomeScenePresenter()

            SomeSceneAssembler.assemble(someSceneViewController, someSceneInteractor, someScenePresenter)

            window?.rootViewController = someSceneViewController
            window?.makeKeyAndVisible()
        }

        return true
    }
}
