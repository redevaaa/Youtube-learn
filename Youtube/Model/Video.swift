//
//  Video.swift
//  Youtube
//
//  Created by redevaaa on 2020/12/13.
//

import Foundation
import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: Int?
    var uploadDate: Date?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
