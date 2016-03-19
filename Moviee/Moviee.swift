//
//  Moviee.swift
//  Moviee
//
//  Created by Luca Peduto on 19/03/16.
//  Copyright © 2016 Eloquent Bit. All rights reserved.
//

import Foundation

class Movies {
    
    private var _mName: String
    private var _mCategory: String
    private var _mImid: String
    private var _mVideoUrl: String
    private var _mImageUrl: String
    private var _mDirector: String
    private var _mReleaseDate: String
    
    var mName: String {
        return _mName
    }
    
    var mCategory: String {
        return _mCategory
    }
    
    var mImid: String {
        return _mImid
    }
    
    var mImageUrl: String {
        return _mImageUrl
    }
    
    var mVideoUrl: String {
        return _mVideoUrl
    }
    
    var mDirector: String {
        return _mDirector
    }
    
    var mReleaseDate: String {
        return _mReleaseDate
    }
    
    init(data: JSONDictionary) {
        
        // Movie name
        if let name = data["im:name"] as? JSONDictionary,
            mName = name["label"] as? String {
                self._mName = mName
        } else {
            _mName = ""
        }
        
        // Category
        if let category = data["category"] as? JSONDictionary,
            attributes = category["attributes"] as? JSONDictionary,
            mCategory = attributes["label"] as? String {
                self._mCategory = mCategory
        } else {
            _mCategory = ""
        }
        
        // Imid
        if let imid = data["id"] as? JSONDictionary,
            attributes = imid["attributes"] as? JSONDictionary,
            id = attributes["im:id"] as? String {
                self._mImid = id
        } else {
            _mImid = ""
        }
        
        // Image Url
        if let imImage = data["im:image"] as? JSONArray,
            aImage = imImage[2] as? JSONDictionary,
            mImage = aImage["label"] as? String {
                self._mImageUrl = mImage
        } else {
            _mImageUrl = ""
        }
        
        // Video Url
        if let link = data["link"] as? JSONArray,
            mUrl = link[1] as? JSONDictionary,
            mHref = mUrl["attributes"] as? JSONDictionary,
            mVideoUrl = mHref["href"] as? String {
                self._mVideoUrl = mVideoUrl
        } else {
            _mVideoUrl = ""
        }
        
        // Director
        if let artist = data["im:artist"] as? JSONDictionary,
            mArtist = artist["label"] as? String {
                self._mDirector = mArtist
        } else {
            _mDirector = ""
        }
        
        // Release Date
        if let rDate = data["im:releaseDate"] as? JSONDictionary,
            attributes = rDate["attributes"] as? JSONDictionary,
            label = attributes["label"] as? String {
                self._mReleaseDate = label
        } else {
            _mReleaseDate = ""
        }
    }
    
    func getInfo() {
        print("----------------------")
        print("Movie name = \(self.mName)")
        print("Movie director = \(self.mDirector)")
        print("Movie genre = \(self.mCategory)")
        print("Movie release date = \(self.mReleaseDate)")
        print("Movie id = \(self.mImid)")
        print("Movie image url = \(self.mImageUrl)")
        print("Movie video url = \(self.mVideoUrl)")
        print("----------------------")

    }
}
