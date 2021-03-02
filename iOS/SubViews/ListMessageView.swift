//
//  ListMessageView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI

struct ListMessageView: View {
    var body: some View {
        LazyVStack {
            ForEach(0..<15) {_ in
                NavigationLink(destination: Text("Message View")) {
                    ListMessageItemView(isUnread: Bool.random(), lastMessage: "Utilisez le code de vérification 331372 pour l’authentification Microsoft.")
                        
                        .padding(.leading, 10)
                        
                }.buttonStyle(PlainButtonStyle())
                
            }.onDelete(perform: { _ in
                print("delete")
            })
        }
    }
}

struct ListMessageVieww_Previews: PreviewProvider {
    static var previews: some View {
        ListMessageView()
    }
}
