//
//  DesertListView.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 4/09/24.
//

import SwiftUI

struct DesertListView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var result: [Meal] {
        viewModel.mealList
     // mealsMocks
    }
    
    @State private var searchDesert = ""
    
    var body: some View {
        VStack{
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(result, id: \.id) { dessert in
                    
                    NavigationLink {
                        DetailMealFactory.create(id: dessert.id)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarItems(leading: CustomBackButton())
                        
                        
                    } label: {
                        CardView(meal: dessert)
                       
                    }
                }
            }
            .searchable(text: $searchDesert)
            
        }
       .onChange(of: searchDesert) { oldValue, newValue in
          viewModel.searchMeal(meal: newValue)
       }
        .padding(.horizontal)
        
    }
    
}

#Preview {
    DesertListView(viewModel: HomeViewModelMock)
}
