//
//  StoryViewModel.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import Foundation

class StoryViewModel {
    
    private let repository = StoryRepository()
    
    func getStories() {
        self.repository.getStories()
    }
}
