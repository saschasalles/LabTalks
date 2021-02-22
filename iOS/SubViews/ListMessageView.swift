//
//  ListMessageView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI

struct ListMessageView: View {
    var body: some View {
        Section(header: Text("Last Messages")) {
            ListMessageItemView(isUnread: true)
            ListMessageItemView(isUnread: true)
            ListMessageItemView(isUnread: false)
            ListMessageItemView(isUnread: false)
            ListMessageItemView(isUnread: true)
            ListMessageItemView(isUnread: true)
            ListMessageItemView(isUnread: false)
            ListMessageItemView(isUnread: false)
        }
    }
}

struct ListMessageVieww_Previews: PreviewProvider {
    static var previews: some View {
        ListMessageView()
    }
}
