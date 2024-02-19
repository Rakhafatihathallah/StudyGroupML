//
//  OrderFoodView.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 11/02/24.
//

import SwiftUI
import Kingfisher

struct FoodOrderView: View {
    @Environment(\.dismiss) var dismiss
    @State private var counter: Int = 0
    let food: FoodData
    @State var show: Bool = false
    @State var degree = 0.0
    @Namespace var namespace
    @State var animate: Bool = false
    @Binding var showPopup: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //Image
            VStack() {
                KFImage(URL(string: food.image_url))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 270)
                    .clipped()
                //Food Order
                VStack(spacing: 16) {
                    //food name
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(food.name)
                                .font(.title)
                                .fontWeight(.semibold)
                            HStack {
                                ForEach(1...5, id:\.self) { index in
                                    SystemImage.rating
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }.foregroundColor(.yellow)
                                Text(String(format: "%.1f", food.rating))
                                    .foregroundColor(.gray)
                            }
                        }.padding(.bottom)
                        Spacer()
                        
                        Button {
                            //action
                            decrement()
                        } label: {
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .padding(4)
                                .foregroundColor(.white)
                            
                        }
                        .background(counter == 0 ? .gray : ColorAsset.baseColor)
                        .clipShape(Circle())
                        
                        Text("\(counter)")
                            .padding(.horizontal, 10)
                        
                        Button {
                            //action
                            increment()
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .padding(4)
                                .foregroundColor(.white)
                            
                        }
                        .background(ColorAsset.baseColor)
                        .clipShape(Circle())
                        
                    }
                    //price
                    Text("Rp.\(food.price)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        if !show {
                            Text("Place Order")
                                .matchedGeometryEffect(id: "ToCircle", in: namespace)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(ColorAsset.baseColor)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            RoundedRectangle(cornerRadius: 40, style: .continuous)
                                .trim(from: 0, to: 0.95)
                                .stroke(lineWidth: 3)
                                .matchedGeometryEffect(id: "ToCircle", in: namespace)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(width: 55, height: 55)
                                .rotationEffect(.degrees(degree))
                        }
                    }
                    .padding(.vertical)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation(.linear(duration: 3).repeatCount(3, autoreverses: false)) {
                                degree = 360
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showPopup.toggle()
                            dismiss()
                        }
                    }
                    //
                }.padding()
            }
        }.ignoresSafeArea()
    }
}


//struct Previews_FoodOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodOrderView(food: FoodData(id: 1, name: "Noodle Ex", rating: 4.6, image_url: "https://i.pinimg.com/564x/74/e6/66/74e66635b6386750a1153937bbacc3ad.jpg", price: 8000, table: 1, chair: 1))
//    }
//}

extension FoodOrderView {
    func increment() {
        counter += 1
    }
    func decrement() {
        if counter <= 0 {
            counter = 0
        } else {
            counter -= 1
        }
    }
}
