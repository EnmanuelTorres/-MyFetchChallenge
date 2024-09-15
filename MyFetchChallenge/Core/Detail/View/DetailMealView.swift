//
//  DetailMealView.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 7/09/24.
//

import SwiftUI

struct DetailMealView: View {
    
    @StateObject var viewModel : DetailMealViewModel
     var id: String
     private var detailMeal: DetailMealModel? {
         return  viewModel.detailMeal
      }
    
      let gradient: Gradient = Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)])
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50.0) {
                AsyncImage(url: URL(string: detailMeal?.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
            
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                .frame(height: 300)
                .background(
                    LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                )
                
                VStack(spacing: 30.0) {
                    if let detailMeal = detailMeal {
                        Text(detailMeal.name )
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Loading Recipe...")
                            .font(.body)
                            .padding(.horizontal)
                    }
                  
                    
                    if let detailMeal = detailMeal {
                        Text(detailMeal.instructions )
                            .font(.headline)
                            .padding()
                    }
                    
                    Text("Ingredients & Measurements")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    if let detailMeal = detailMeal {
                        ForEach(Array(zip(detailMeal.ingredients, detailMeal.measurements)), id: \.0) { ingredient, measurement in
                            HStack {
                                Text(ingredient)
                                    .font(.body)
                                Spacer()
                                Text(measurement)
                                    .font(.body)
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        Text("Loading ingredients...")
                            .font(.body)
                            .padding(.horizontal)
                    }
                   
                    
                }
            }
            
            
        }
        .ignoresSafeArea(.container, edges: .top)
        .onAppear{
            viewModel.getMeal(id: id)
        }
    }
}

#Preview {
    DetailMealView(viewModel: detailMealViewModelMock, id: "52771")
}
