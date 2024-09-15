//
//  CardView.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 4/09/24.
//

import SwiftUI

struct CardView: View {
    
    
    var meal: Meal
    
    let  gradient: Gradient = Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)])
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: meal.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(meal.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Text(meal.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: 136)
                            .padding()
                    }
        }
            
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(
            LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 10)
        
    }
}

#Preview {
    CardView(meal: mealMock)
}
