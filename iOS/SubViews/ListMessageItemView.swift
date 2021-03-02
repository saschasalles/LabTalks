//
//  ListMessageItemView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI

struct ListMessageItemView: View {
    @State var isUnread = false
    @State var contactFirstName: String
    @State var contactLastName: String
    @State var lastMessage: String
    var body: some View {
        
        HStack {
            if self.isUnread {
                Circle()
                    .frame(width:12, height: 12)
                    .foregroundColor(.blue)
                    .padding(0)
            }
            
            Circle()
                .frame(width: 48, height: 48)
                .foregroundColor(Color(#colorLiteral(red: 0.7492758632, green: 0.7693317533, blue: 0.7860328555, alpha: 1)))
                .overlay(Text(getInitials(forFirstName: self.contactFirstName, andLastName: self.contactLastName))
                            .font(Font.system(.title3, design: .rounded))
                            .bold()
                            .foregroundColor(.white))
                .padding(.trailing, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("\(contactFirstName) \(contactLastName)")
                        .font(.body)
                        .bold()
                    Spacer()
                    Text("Today")
                        .font(Font.system(size: 15))
                        .foregroundColor(.gray)
                }.padding(.trailing)
                
                VStack{
                    Text(self.lastMessage)
                        .font(Font.system(size: 15))
                        .foregroundColor(Color(.systemGray))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }.frame(height: 40, alignment: .leading)
                .padding(.trailing)
                
                Divider()
            }
            
        }
        .padding(.leading, isUnread ? 0 : 20)
    }
}

func getInitials(forFirstName first: String, andLastName second: String) -> String {
    guard let firstInitial = first.first, let secondInitial = second.first else { return "" }
    let res = "\(firstInitial)\(secondInitial)"
    return res
}

struct ListMessageItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListMessageItemView(isUnread: true, contactFirstName: "",  contactLastName: "",lastMessage: "As tu jeté un sort à Dobby ?")
    }
}

