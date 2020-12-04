@testable import App
import XCTest

class Tests: XCTestCase {
    func testTappingAButton() throws {
        let controller = loadHomeViewController()
        controller.toggleTextButton.tap()
        XCTAssertFalse(controller.textLabel.isHidden)
    }

    func testPushingAViewController() throws {
        let controller = loadHomeViewController()

        controller.pushDetailButton.tap()

        XCTAssertEqual(controller.navigationController?.viewControllers.count, 2)
        XCTAssert(controller.navigationController?.topViewController is DetailViewController)
    }

    func testPresentingAModalViewController() throws {
        let window = UIWindow()
        let controller = loadHomeViewController(in: window)

        controller.presentModalButton.tap()

        XCTAssertNotNil(controller.navigationController?.presentedViewController)
        XCTAssert(controller.navigationController?.presentedViewController is ModalViewController)
    }
}

extension XCTestCase {
    func loadHomeViewController(in window: UIWindow? = nil) -> HomeViewController {
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [homeViewController]

        if let window = window {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }

        homeViewController.loadViewIfNeeded()
        return homeViewController
    }
}

extension UIButton {
    func tap() {
        sendActions(for: .touchUpInside)
        RunLoop.current.run(until: Date())
    }
}
