//
//  StoryCoordinator.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import UIKit

class StoryCoordinator: Coordinator {
    
    let presenter: Router //UINavigationController
    var storyView: StoryView?
    
    init(presenter: Router) {
        self.presenter = presenter
    }
    
    func start() {
        let storyView = StoryView()
        storyView.title = "Stories"
        storyView.view.backgroundColor = .white
        self.presenter.push(storyView, animated: true, completion: nil) //pushViewController(storyView, animated: true)
        self.storyView = storyView
    }
}
