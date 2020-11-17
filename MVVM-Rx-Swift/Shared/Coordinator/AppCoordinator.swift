//
//  AppCoordinator.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let rootView: UINavigationController
    let window: UIWindow
    let appRouter: AppRouter
    
    init(window: UIWindow) {
        self.window = window
        self.rootView = UINavigationController()
        self.rootView.navigationBar.prefersLargeTitles = true
        self.appRouter = AppRouter(navigation: rootView)
    }
    
    func start() {
        window.rootViewController = appRouter.toPresentable()
        let storyCoordinator = StoryCoordinator(presenter: appRouter)
        storyCoordinator.start()
        window.makeKeyAndVisible()
    }
}
