//
//  Animation.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 30/01/24.
//

import SwiftUI

struct AnimationView: View {
    @State var currentTab = 0
    @State var isShowDetail = false
    var body: some View {
        VStack(spacing: 0) {
            headerView()
            
            Divider()
            
            ScrollView {
                ForEach(0...5, id: \.self) { index in
                    cardView()
                }
            }
        }
    }
}

extension AnimationView {
    
    // @ViewBuilder = untuk membuat view dari function atau variabel
    @ViewBuilder
    func headerView() -> some View {
        HStack(spacing: 0) {
            Button {
                withAnimation {
                    currentTab = 0
                }
            } label: {
                Text("All")
                    .font(currentTab == 0 ? .headline : .body)
                    .foregroundColor(currentTab == 0 ? .blue : .black)
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            .overlay(alignment: .bottom) {
                if currentTab == 0 {
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 2)
                        .transition(.move(edge: .trailing))
                }
            }
            
            Button {
                withAnimation {
                    currentTab = 1
                }
            } label: {
                Text("Following")
                    .font(currentTab == 1 ? .headline : .body)
                    .foregroundColor(currentTab == 1 ? .blue : .black)
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            .overlay(alignment: .bottom) {
                if currentTab == 1 {
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 2)
                        .transition(.move(edge: .leading))
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func cardView() -> some View {
       
            Button {
                isShowDetail.toggle()
            } label: {
                Text("This is title")
                    .font(.headline)
                Text("This is description bla bla bla bla")
                    .font(.caption)
                
                Divider()
            }
            .multilineTextAlignment(.leading)
            .foregroundColor(.black)
            .padding(.horizontal)
            
        }
    }

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
