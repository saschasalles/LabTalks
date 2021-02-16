//
//  WelcomeView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 16/02/2021.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isSignInPresented = false
    @State private var isSignUpPresented = false
    @Binding var isWelcomePresented: Bool
    var body: some View {
        ZStack{
            AnimatedBackground()
            VStack(spacing: 90){
                Image("app_icon")
                    .antialiased(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .interpolation(.high)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 70)
                VStack(alignment: .trailing) {
                    Text("Innovation distinguishes between a leader and a follower.")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    Text("Steve Jobs")
                        .foregroundColor(.white)
                        .padding()
                }.padding(.top)
                HStack(spacing: 15) {
                    Button(action: {
                        withAnimation(.easeOut(duration: 1.2)) {
                            self.isSignUpPresented.toggle()
                        }
                    }, label: {
                        HStack {
                            Text("Sign up")
                                .font(.title3)
                                .bold()
                            Image(systemName: "person.badge.plus")
                                .font(.title2)
                        }
                        .foregroundColor(.white)
                    })
                    .buttonStyle(ScaledButtonStyle(bgColor: Color(#colorLiteral(red: 0.1851128745, green: 0.1840875996, blue: 0.2160720039, alpha: 0.7908960459))))
                    .fullScreenCover(isPresented: self.$isSignUpPresented, content: {
                        SignUpView(isPresented: self.$isSignUpPresented, isWelcomePresented: self.$isWelcomePresented)
                    })
                    
                    Button(action: {
                        withAnimation(.easeOut(duration: 1.2)) {
                            self.isSignInPresented.toggle()
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
                    .buttonStyle(ScaledButtonStyle(bgColor: Color(#colorLiteral(red: 0.1851128745, green: 0.1840875996, blue: 0.2160720039, alpha: 0.7908960459))))
                    .fullScreenCover(isPresented: self.$isSignInPresented, content: {
                        SignInView(isPresented: self.$isSignInPresented, isWelcomePresented: self.$isWelcomePresented)
                    })
                    
                }
            }.padding()
            
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)


    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(isWelcomePresented: .constant(true))
    }
}
