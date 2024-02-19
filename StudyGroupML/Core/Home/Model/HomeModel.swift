//
//  HomeModel.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 07/02/24.
//

import Foundation

struct HomeModel: Codable {
    let status: String
    let foods: [FoodData]
}

struct FoodData: Codable, Identifiable {
    let id: Int
    let name: String
    let rating: Double
    let image_url: String
    let price: Int
    let table: Int
    let chair: Int
}

struct BannerModel: Identifiable {
    let id: Int
    let name: String
}
