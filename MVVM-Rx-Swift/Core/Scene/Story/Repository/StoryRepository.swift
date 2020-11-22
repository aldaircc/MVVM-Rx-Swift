//
//  StoryRepository.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/17/20.
//

import RxSwift

struct StoryRepository {
 
    let storyRemote = StoryRemoteDataSource()
    let storyLocal = StoryLocalDataSource()
    typealias StoryResult = (stories: [Story], status: Bool)
    
    func getStories() -> Observable<StoryResult>{
        storyRemote.getStories()
    }
    
}

protocol StoryDataSource {
    func getStories() -> Observable<StoryResult>
    func addStories()
    typealias StoryResult = (stories: [Story], status: Bool) //[StoryEntity], status: Bool)
}
