//
//  VideoModel.swift
//  VideoFounder
//
//  Created by Luka Šalipur on 7.8.22..
//

import Foundation



struct ResponseBody: Decodable{
    var page:Int
    var perPage:Int
    var totalResult:Int?
    var url:String
    var videos:[Video]
    
  
}

struct Video: Identifiable, Decodable{
    var id: Int
    var url:String
    var image:String
    var duration:Int
    var videoFiles:[VideoFile]
    
  
}

struct VideoFile: Identifiable, Codable{
    var id:Int
    var link:String
}
