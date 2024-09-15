//
//  HomeViewModel.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 4/09/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var mealList: [Meal] = []
    private var originalMealList: [Meal] = []
    
    private let repository: DessertListRepositoryType
   
    
    init(repository: DessertListRepositoryType) {
        self.repository = repository
    }
    
    
    func getDessertList() {
        Task { @MainActor in
            let result = await repository.getDessertList()
            
            DispatchQueue.main.async {
                switch result {
                case .success(let dessertList):
                    Task { @MainActor in
                        self.mealList = dessertList
                        self.originalMealList = dessertList
                    }
                    
                case .failure(let error):
                    print("Error fetching desserts: \(error.localizedDescription)")
                    
                }
            }
        }
    }
}

extension HomeViewModel{
    func searchMeal(meal: String) {
        if meal.isEmpty {
            mealList = originalMealList
        }else {
            mealList = originalMealList.filter{ $0.name.lowercased().contains(meal.lowercased()) || $0.id.contains(meal) }
        }
    }
}
