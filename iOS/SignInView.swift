//
//  SignInView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI

struct SignInView: View {
    @Binding var isPresented: Bool
    @Binding var isWelcomePresented: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var colors = [Color(#colorLiteral(red: 0.1244810298, green: 0.1984634399, blue: 0.3261451125, alpha: 1)), Color(#colorLiteral(red: 0.1125099916, green: 0.1603941221, blue: 0.3757450064, alpha: 1)), Color(#colorLiteral(red: 0.08556153169, green: 0.1475736123, blue: 0.2967944588, alpha: 1)), Color("barBlue"), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))]
    var body: some View {
        ZStack {
            AnimatedBackground(colors: colors).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation() {
                            self.isPresented.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .antialiased(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.8000372024)))
                            .font(.largeTitle)
                    })
                }
                Spacer()
                HStack {
                    Image("app_icon")
                        .interpolation(.high)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(width: 80)

                    Text("LabTalks")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }

                VStack(spacing: 20) {
                    CustomTextField(value: $email, image: "envelope.fill", placeholder: "Email")
                    CustomTextField(value: $password, image: "key.fill", placeholder: "Password", isSecure: true)

                    Button(action: {
                        print("submit")
                        withAnimation(.easeOut(duration: 1.2)) {
                            self.isPresented.toggle()
                            self.isWelcomePresented.toggle()
                        }
                    }, label: {
                        HStack {
                            Text("Sign in")
                                .font(.title3)
                                .bold()
                            Image(systemName: "arrow.right.circle")
                                .font(.title2)

                        }
                            .foregroundColor(.white)
                    })
                        .buttonStyle(ScaledButtonStyle())
                        .padding(.top)
                }.padding(.top)
                Spacer()
            }.padding()
        } .transition(AnyTransition.move(edge: .leading))
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(isPresented: .constant(true), isWelcomePresented: .constant(true))
    }
}
