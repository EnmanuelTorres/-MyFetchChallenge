//
//  HomeView.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 4/09/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel : HomeViewModel
   
    
    private var result: [Meal] {
        return  viewModel.mealList
    }
    
    init(viewModel: HomeViewModel){
        self.viewModel = viewModel
       
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                DesertListView(viewModel: viewModel)
                
            }
            .onAppear{
                viewModel.getDessertList()
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModelMock)
}
