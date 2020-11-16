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
    
    init(window: UIWindow) {
        self.window = window
        self.rootView = UINavigationController()
        self.rootView.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        window.rootViewController = rootView
        let storyCoordinator = StoryCoordinator(presenter: rootView)
        storyCoordinator.start()
        window.makeKeyAndVisible()
    }
}
