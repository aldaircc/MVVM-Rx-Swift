//
//  Story.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import Foundation

struct Stories: Codable {
    var hits: [Story]?
}

struct Story: Codable{
    
    //    let highlightResult : HighlightResult?
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

        enum CodingKeys: String, CodingKey {
    //            case highlightResult = "_highlightResult"
                case tags = "_tags"
                case author = "author"
                case commentText = "comment_text"
                case createdAt = "created_at"
                case createdAtI = "created_at_i"
                case numComments = "num_comments"
                case objectID = "objectID"
                case parentId = "parent_id"
                case points = "points"
    //                case storyId = "story_id"
                case storyText = "story_text"
                case storyTitle = "story_title"
                case storyUrl = "story_url"
                case title = "title"
                case url = "url"
        }
}
