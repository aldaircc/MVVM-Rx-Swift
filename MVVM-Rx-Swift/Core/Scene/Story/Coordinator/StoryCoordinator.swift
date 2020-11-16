//
//  StoryCoordinator.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import UIKit

class StoryCoordinator: Coordinator {
    
    let presenter: UINavigationController
    var storyView: StoryView?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyView = StoryView()
        storyView.title = "Stories"
        storyView.view.backgroundColor = .white
        self.presenter.pushViewController(storyView, animated: true)
        self.storyView = storyView
    }
}
