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
                    .frame(width:12, height: 12)
                    .foregroundColor(.blue)
            }
            
            Circle()
                .frame(width:45, height: 45)
                .foregroundColor(Color(.systemGray2))
                .overlay(Text("SS")
                            .font(Font.system(.title3, design: .rounded))
                            .bold()
                            .foregroundColor(.white))
            
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
        .padding(.leading,self.isUnread ? -10 : 10)
        .padding(.trailing, 8)
        .padding(.vertical, 8)
    }
}

struct ListMessageItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListMessageItemView(isUnread: true)
    }
}

