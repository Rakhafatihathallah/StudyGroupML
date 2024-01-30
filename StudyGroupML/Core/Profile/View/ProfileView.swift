//
//  ProfileViewTest.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 30/01/24.
//

import SwiftUI

struct ProfileView: View {
    private var accountData : [ProfileModel] = [.init(icon: SystemImage.creditCard,
                                               title: "Payment Method"),
                                                .init(icon: SystemImage.shoppingCart,
                                               title: "My Cart"),
                                                .init(icon: SystemImage.help,
                                               title: "Help & Support"),
                                                .init(icon: SystemImage.notification,
                                               title: "Notifications"),]
    
    private var moreInfoData : [ProfileModel] = [.init(icon: SystemImage.privacy,
                                               title: "Privacy Policy"),
                                                .init(icon: SystemImage.news,
                                               title: "News & Services"),
                                                .init(icon: SystemImage.rating,
                                               title: "Give Rating")]

    var body: some View {
        NavigationStack {
            List {
                HStack(spacing: 16) {
                    LocalImage.profilePicture
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Rakha Fatih")
                            .fontModifier(size: 20)
                            .fontWeight(.medium)
                        Text("rakha@gmail.com")
                            .fontModifier(size: 16)
                    }
                    Spacer()
                    // Edit
                    HStack {
                        SystemImage.pencil
                            .frame(width: 20, height: 20)
                        Text("Edit")
                    }
                }.listRowSeparator(.hidden)
                Section("Account") {
                    ForEach(accountData, id: \.title) { account in
                        NavigationLink {
                            Text(account.title)
                        } label: {
                            HStack {
                                account.icon
                                    .foregroundColor(Color(.darkGray))
                                Text(account.title)
                            }
                        }

                    }
                }.listSectionSeparator(.hidden)
                Section("More Info") {
                    ForEach(moreInfoData, id: \.title) { account in
                        NavigationLink {
                            Text(account.title)
                        } label: {
                            HStack {
                                account.icon
                                    .foregroundColor(Color(.darkGray))
                                Text(account.title)
                            }
                        }

                    }
                }.listSectionSeparator(.hidden)
                HStack {
                    Spacer()
                    Button {
                        //action
                    } label: {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                    Spacer()
                }
                .listRowSeparator(.hidden)
                .padding(.vertical, 40)
                
            }
            
            .listStyle(PlainListStyle())
            .navigationTitle("Profile")
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileModel {
    var icon: Image
    var title: String
}

