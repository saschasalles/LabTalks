//
//  ListMessageView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI
import Fakery

struct ListMessageView: View {
    public let faker = Faker(locale: "fr")
    var body: some View {
        VStack {
            ForEach(0..<15) { _ in
                NavigationLink(destination: Text("Message View")) {
                    ListMessageItemView(isUnread: Bool.random(), contactFirstName: faker.name.firstName(), contactLastName: faker.name.lastName(), lastMessage: faker.lorem.sentence(wordsAmount: 10))
                        .padding(.leading, 10)
                        
                }.buttonStyle(PlainButtonStyle())
                
            }.onDelete(perform: { _ in
                print("delete")
            })
        }.padding(.vertical)
    }
}

struct ListMessageVieww_Previews: PreviewProvider {
    static var previews: some View {
        ListMessageView()
    }
}
