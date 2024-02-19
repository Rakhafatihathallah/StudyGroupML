//
//  HomeView.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 29/01/24.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    @State private var showBottomSheet: Bool = false
    @State var selectedFoods: FoodData?
    @State var showPopup = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // parent vstack
            VStack(spacing: 5) {
               
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hi Michael!")
                            .font(.title2).bold()
                        Text("Get your favorite food here")
                    }
                    Spacer()
                    NavigationLink {
                        Text("Cart")
                    } label: {
                        SystemImage.shoppingCart
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23, height: 23)
                    }

                }
                
                //banner
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 320, height: 160)
                                .foregroundColor(Color(.lightGray))
                        }
                    }.padding(.vertical, 30)
                }
                
                // category
                HStack(spacing: 40) {
                    ForEach(0..<4) { index in
                        VStack {
                            Circle()
                                .frame(width: 48, height: 48)
                                .foregroundColor(Color(.lightGray))
                            Text("Food")
                        }
                    }
                }
                
                HStack {
                    Text("Recommendation")
                        .font(.title3).bold()
                    Spacer()
                }
                .padding(.top, 50)
                .padding(.bottom, 10)
                //food list
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 40) {
                        ForEach(vm.foodData, id:\.name) { food in
                            Button {
                                withAnimation {
                                    selectedFoods = food
                                }
                            } label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    KFImage(URL(string: food.image_url))
                                        .resizable()
                                        .aspectRatio(CGSize(width: 3, height: 3.2),
                                                     contentMode: .fill)
                                        .frame(width: 180, height: 180)
                                    //text
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(food.name)
                                            .fontWeight(.medium)
                                            .foregroundColor(.primary)
                                        Text("\(food.table) table \(food.chair) chair")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text("Rp.\(food.price)")
                                            .foregroundColor(.primary)
                                    }
                                    .padding(.vertical)
                                    .padding(.horizontal, 8)
                                }
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 5)
                            }

                        }
                    }.frame(height: 300)
                }
                
                
            }.frame(maxWidth: .infinity, alignment: .leading).padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            vm.getFoodData()
        }
        
       
        .sheet(item: $selectedFoods) { food in
            FoodOrderView(food: food, showPopup: $showPopup)
                .presentationDetents([.fraction(0.7)])
        }
        .sheet(isPresented: $showPopup) {
            LottieView(filename: "Animation - 1706953226715", mode: .playOnce)
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
