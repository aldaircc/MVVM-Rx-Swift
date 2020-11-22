//
//  StoryRemoteDataSource.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/17/20.
//

import RxSwift

struct StoryRemoteDataSource: StoryDataSource, NetWorkClient {
    func getStories() -> Observable<StoryResult> {
        Observable<StoryResult>.create { (observer) -> Disposable in
            
            callService("https://hn.algolia.com/api/v1/search_by_date",
                        method: .Get,
                        objectType: Stories.self) { (response) in
                switch response {
                case .success(let story):
                    if let stories = story.hits{
                        observer.onNext((stories: stories, status: true))
                    }
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
            
            return Disposables.create()
        }
    }
    
    func addStories() {
        
    }
    
}
