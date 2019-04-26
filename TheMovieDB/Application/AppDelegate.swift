import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = ViewFactory.viewController(viewType: .movieList)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        
        return true
    }
}
