import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = makeRootViewController()
        window?.makeKeyAndVisible()
    }

    private func makeRootViewController() -> UINavigationController {
        let viewModel = ProductListViewModel()
        let rootViewController = ProductsListViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: rootViewController)
    }
}
