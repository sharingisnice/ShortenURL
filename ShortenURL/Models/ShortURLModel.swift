//
//  ShortURLModel.swift
//  ShortenURL
//
//  Created by Mert Ejder on 15.08.2021.
//

import Foundation

struct ShortURLModel: Codable {
    let ok: Bool
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let code, shortLink: String
    let fullShortLink: String
    let shortLink2: String
    let fullShortLink2: String
    let shareLink: String
    let fullShareLink: String
    let originalLink: String

    enum CodingKeys: String, CodingKey {
        case code
        case shortLink = "short_link"
        case fullShortLink = "full_short_link"
        case shortLink2 = "short_link2"
        case fullShortLink2 = "full_short_link2"
        case shareLink = "share_link"
        case fullShareLink = "full_share_link"
        case originalLink = "original_link"
    }
}
