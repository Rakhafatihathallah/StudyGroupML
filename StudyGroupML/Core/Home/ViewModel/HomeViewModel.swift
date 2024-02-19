//
//  HomeViewModel.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 07/02/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var foodData: [FoodData] = []
    @Published var counter: Int = 0
    
    func getFoodData() {
        guard let data = try? StaticJSONMapper.decode(file: "FoodListResponse", type: HomeModel.self) else { return }
        DispatchQueue.main.async {
            self.foodData = data.foods
        }
    }
}
