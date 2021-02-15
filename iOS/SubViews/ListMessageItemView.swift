//
//  ListMessageItemView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI

struct ListMessageItemView: View {
    @State var isUnread = false
    var body: some View {
        
        HStack {
            if self.isUnread {
                Circle()
                    .frame(width:10, height: 10)
                    .foregroundColor(.blue)
            }
            
            Circle()
                .frame(width:35, height: 35)
                .foregroundColor(Color("barBlue"))
                .overlay(Text("SS").foregroundColor(.white))
            
            VStack(alignment: .leading) {
                Text("Contact Name")
                    .font(.callout)
                    .bold()
                Text("Message description")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack{
                Text("Today")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
        }
        .padding(.leading,self.isUnread ? -8 : 10)
        .padding(.trailing, 8)
        .padding(.vertical, 8)
    }
}

struct ListMessageItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListMessageItemView(isUnread: true)
    }
}

