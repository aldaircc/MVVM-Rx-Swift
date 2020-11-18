//
//  StoryLocalDataSource.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/17/20.
//

import Foundation

struct StoryLocalDataSource: StoryDataSource {
    
    func getStories() {
        print("Get stories from core data")
    }
    
    func addStories() {
        print("Save story to core data")
    }
    
    
}
