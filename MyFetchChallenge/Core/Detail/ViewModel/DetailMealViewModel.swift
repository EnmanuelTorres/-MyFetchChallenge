//
//  DetailMealViewModel.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 7/09/24.
//

import Foundation

class DetailMealViewModel: ObservableObject {
    
    
    @Published var detailMeal: DetailMealModel? = nil
    private let repository: DetailMealRepositoryType
    
    init(repository: DetailMealRepositoryType) {
        self.repository = repository
    }
    
    func getMeal(id: String) {
        Task { @MainActor in
           
                let result = await repository.getMealDetail(id: id)
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let detailMeal):
                        Task { @MainActor in
                            self.detailMeal = detailMeal
                           
                        }
                        
                    case .failure(let error):
                        print("Error fetching desserts: \(error.localizedDescription)")
                       
                    }
                }
                
            
        }
    }
    
}
