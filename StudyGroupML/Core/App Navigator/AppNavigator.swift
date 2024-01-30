//
//  AppNavigator.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 30/01/24.
//

import SwiftUI

final class AppNavigator: ObservableObject {
    @Published var routes: [Route] = []
    
    func navigate(to view: Route) {
        routes.append(view)
    }
    
    func back() {
        _ = routes.popLast()
    }
    
    func backToRoot() {
        routes.removeAll()
    }
    
}

enum Route {
    case Home(AppNavigator)
    case Food(AppNavigator)
    case Profile(AppNavigator)
}

//extension Route: View {
//    var body: some View {
//        switch self {
//        case .Home(let navigator):
//            HomeView(navigator: navigator)
//        case .Food(let navigator):
//            HomeView(navigator: navigator)
//        case .Profile(let navigator):
//            HomeView(navigator: navigator)
//        }
//    }
//}

extension Route: Hashable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
}
