//
//  Mocks.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 4/09/24.
//

import Foundation

let mealMock = Meal(id: "123",
                    name: "Spicy Arrabiata Penne",
                    image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")

let mealsMocks = [Meal(id: "123",
                       name: "Spicy Arrabiata Penne",
                       image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"),

                  Meal(id: "124",
                                      name: "Spicy Arrabiata Penne",
                                      image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"),

                  Meal(id: "125",
                                      name: "Spicy Arrabiata Penne",
                                      image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"),

                  Meal(id: "126",
                                      name: "Spicy Arrabiata Penne",
                                      image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"),

                  Meal(id: "127",
                                      name: "Spicy Arrabiata Penne",
                                      image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"),
                  Meal(id: "128",
                                      name: "Spicy Arrabiata Penne",
                                      image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"),
                  Meal(id: "129",
                                      name: "Spicy Arrabiata Penne",
                                      image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"),
                  Meal(id: "130",
                                      name: "Spicy Arrabiata Penne",
                                      image: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")]




let HomeViewModelMock =   HomeViewModel(repository: DessertListRepository(apiDatasource: APIMealDataSource(httpClient: URLSessionHTTPClient(requestMaker: URLSessionRequestMaker())),
                                                                          mealMapper: MealMapper(),
                                                                          cacheDatasource: CacheDessertList()))


let detailMealViewModelMock = DetailMealViewModel(repository: DetailMealRepository(apiDatasource: APIMealDataSource(httpClient: URLSessionHTTPClient(requestMaker: URLSessionRequestMaker()))))

let detailMealMock = DetailMealModel(id: "52893",
                                     name: "Apple & Blackberry Crumble",
                                     instructions: "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
                                     ingredients: ["Plain Flour", "Caster Sugar", "Butter"],
                                     measurements: ["120g", "60g", "60g"],
                                     imageURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
