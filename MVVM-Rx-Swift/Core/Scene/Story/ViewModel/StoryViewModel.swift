//
//  StoryViewModel.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import RxSwift

class StoryViewModel {
    
    private let repository = StoryRepository()
    
    func getStories() -> Observable<(stories: [Story], status: Bool)> {
        return self.repository.getStories()
    }
}
