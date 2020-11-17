//
//  AppRouter.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import UIKit

class AppRouter: Router {
    
    unowned let navigation: UINavigationController
    
    var rootView: UIViewController? {
        return navigation.viewControllers.first
    }
    
    var completions: [UIViewController: () -> Void]
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
        self.completions = [:]
    }
    
    func toPresentable() -> UIViewController {
        return navigation
    }
    
    func present(_ module: Showable) {
        self.navigation.present(module.toShowable(), animated: true, completion: nil)
    }
    
    func push(_ module: Showable, animated: Bool, completion: (() -> Void)?) {
        let controller = module.toShowable()
        
        guard controller is UINavigationController == false else {
            return
        }
        
        if let completion = completion {
            completions[controller] = completion
        }
        
        self.navigation.pushViewController(controller, animated: animated)
        
    }
    
    func pop(_ animated: Bool) {
        if let module = self.navigation.popViewController(animated: animated) {
            runCompletion(module)
        }
    }
    
    func runCompletion(_ module: UIViewController) {
        guard let completion = completions[module] else { return }
        completion()
        completions.removeValue(forKey: module)
    }
}
