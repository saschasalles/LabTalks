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
    List {
      ForEach(0..<15) { _ in
        HStack(spacing: 0) {
          NavigationLink(destination: Text("Somewhere")) {
            EmptyView()
          }
            .frame(width: 0)
            .opacity(0)

          ListMessageItemView(
            isUnread: Bool.random(),
            contactFirstName: faker.name.firstName(),
            contactLastName: faker.name.lastName(),
            lastMessage: faker.lorem.sentence(wordsAmount: 10))


        }
          .hideRowSeparator(insets: EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0), background: Color(.systemBackground))

      }.onDelete { _ in
        print("test")
      }
    }
  }
}

struct ListMessageVieww_Previews: PreviewProvider {
  static var previews: some View {
    ListMessageView()
  }
}
