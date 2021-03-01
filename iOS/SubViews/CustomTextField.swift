//
//  CustomTextField.swift
//  LabTalks
//
//  Created by Sascha Sallès on 01/03/2021.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var value: String
    let image: String
    @State var placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if self.value.isEmpty {
                Text(self.placeholder)
                    .foregroundColor(.white)
                    .padding(.leading, 45)
                    .font(Font.system(size: 18, weight: .medium, design: .default))
            }
            HStack {
                Image(systemName: self.image)
                    .frame(width: 18)
                    .padding(.leading)
                    .foregroundColor(Color(.systemGray5))
                if !self.isSecure {
                TextField("", text: self.$value)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(.white)
                } else {
                    SecureField("", text: self.$value)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
            }
                .padding(.vertical, 12)
                .font(Font.system(size: 18, weight: .medium, design: .default))
                .background(RoundedRectangle(cornerRadius: 12))
                .foregroundColor(Color(#colorLiteral(red: 0.1749373674, green: 0.1741261482, blue: 0.2056128979, alpha: 0.3685379959)))
        }
    }
}

struct CustomField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(value: .constant(""), image: "envelope.fill", placeholder: "Email")
    }
}
