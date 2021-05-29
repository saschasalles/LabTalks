//
//  SettingsView.swift
//  LabTalks (iOS)
//
//  Created by Sascha Sallès on 29/05/2021.
//

import SwiftUI

struct SettingsView: View {
  @State private var useBiometric: Bool = false
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("Account")) {
          NavigationLink(destination: Text("Account Info")) {
            HStack(spacing: 15) {
              Image("me")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .shadow(color: Color(.systemGray4), radius: 3, x: 1, y: 1)
                .padding(.vertical, 5)

              VStack(alignment: .leading) {
                Text("Sascha Sallès")
                  .font(.headline)
                Text("sascha.salles@icloud.com")
                  .font(.callout)
                  .foregroundColor(Color(.systemGray2))
              }
            }
          }

          Button {
            print("log out account")
          } label: {
            Label("Sign out", systemImage: "arrow.right")
              .foregroundColor(.accentColor)
          }
        }

        Section {
          Button {
            print("delete account")
          } label: {
            Label("Remove my account", systemImage: "person.crop.circle.badge.xmark")
              .foregroundColor(.red)
          }
        }

        Section(header: Text("Authentication options")) {
          HStack {
            Toggle(isOn: $useBiometric) {
              Label("Use Face ID", systemImage: "faceid")
            }.toggleStyle(SwitchToggleStyle(tint: .accentColor))
          }
        }

        Section(header: Text("Privacy")) {
          NavigationLink(destination: Text("Privacy Info")) {
            Label("Privacy policy", systemImage: "lock.circle.fill")
          }
        }


      }.listStyle(InsetGroupedListStyle())
        .navigationBarTitle(Text("Settings"))
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
