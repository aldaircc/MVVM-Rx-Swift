//
//  StoryRepository.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/17/20.
//

import Foundation

struct StoryRepository {
 
    let storyRemote = StoryRemoteDataSource()
    let storyLocal = StoryLocalDataSource()
    
    func getStories() {
        storyRemote.getStories()
    }
    
}

protocol StoryDataSource {
    func getStories()
    func addStories()
}
