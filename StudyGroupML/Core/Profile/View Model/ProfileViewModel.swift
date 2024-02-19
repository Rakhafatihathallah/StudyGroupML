//
//  ProfileViewModel.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 31/01/24.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {

    @Published var count : Int = 0
    
    func loadData() async {
        do {
            let data = try await URLSession.shared.data(from: URL(string: "......")!)
        } catch {
            
        }
    }
    
    func onLoadData() {
        Task {
            await loadData()
        }
    }
    
    func addCounter() {
        count += 1
    }

}

struct DummyView: View {
    @ObservedObject var viewModel : ProfileViewModel = ProfileViewModel()
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
            Button {
                viewModel.addCounter()
            } label: {
                Text("Add")
            }
        }
    }
}

