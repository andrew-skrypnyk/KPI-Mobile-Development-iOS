//
//  SceneDelegate.swift
//  KPI Example
//
//  Created by Andrew Skrypnik on 09.09.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    /**
    Создаем наш стартовый координатор и инжектим в него все необходимые зависимости.
     Так же создаем instancee App класс, который в дальнейшем будет хендлить ивенты + будет бизнесс логика связанная с лайфсайклом приложения: например то что апка уходит в background
      или то, что апка загрузилась и нам нужно высчитать начальный стейт для нее
      Можно спросить на +1 балл что такое lazy init?
     */
    private lazy var coordinator: AppCoordinator = .init(window: window,
                                                         app: App(application: .shared,
                                                                  abTestsService: ABTestsService(analytics: AnalyticsService(),
                                                                                                 localStorage: .init()),
                                                                  analytics: AnalyticsService()))

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        /**
         Собственно точка входа для нашего приложения
         */
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        coordinator.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

