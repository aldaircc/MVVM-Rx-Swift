//
//  StoryEntity.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/20/20.
//

import Foundation

struct StoryEntity {
    let tags : [String]?
    let author : String?
    let commentText : String?
    let createdAt : String?
    let createdAtI : Int?
    let numComments : Int?
    let objectID : String?
    let parentId : Int?
    let points : Int?
//        let storyId : String?
    let storyText : String?
    let storyTitle : String?
    let storyUrl : String?
    let title : String?
    let url : String?
    
    init(story: Story) {
        self.tags = story.tags
        self.author = story.author
        self.commentText = story.commentText
        self.createdAt = story.createdAt
        self.createdAtI = story.createdAtI
        self.numComments = story.numComments
        self.objectID = story.objectID
        self.parentId = story.parentId
        self.points = story.points
        self.storyText = story.storyText
        self.storyTitle = story.storyTitle
        self.storyUrl = story.storyUrl
        self.title = story.title
        self.url = story.url
    }
}
