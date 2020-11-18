//
//  StoryRemoteDataSource.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/17/20.
//

import Foundation

struct StoryRemoteDataSource: StoryDataSource, NetWorkClient {
    
    func addStories() {
        
    }
    
    
    func getStories() {
        callService("https://hn.algolia.com/api/v1/search_by_date",
                    method: .Get,
                    objectType: Stories.self) { (response) in
            switch response {
            case .success(let story):
                print("Stories")
                print(story)
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
