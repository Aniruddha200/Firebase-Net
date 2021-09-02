//
//  ContentView.swift
//  Firebase Net
//
//  Created by administrator on 30/08/2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
	
	// Add a new document with a generated ID
	
	@State private var username = ""
	@State private var password = ""
	@State private var isVerifiedAlertShowing = false
	@State private var isUnverifiedAlertShowing = false
	
	@State var auth = Auth.auth()
	var body: some View {
		NavigationView{
			VStack{
				VStack{
					TextField("Username", text: $username)
					TextField("Password", text: $password)
				}
				.autocapitalization(.none)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.padding()
				Button(action: {auth.signIn(withEmail: username, password: password) { _, error in
					if error == nil{
						isVerifiedAlertShowing.toggle()
					}
					else{
						isUnverifiedAlertShowing.toggle()
						
						print(error?.localizedDescription ?? "Unknown Error")
					}
				}}){
					Text("SignIn")
						.frame(width: 100, height: 50, alignment: .center)
						.background(Color.red)
						.foregroundColor(.white)
						.clipShape(Capsule())
					NavigationLink("", destination: SecondView(auth: $auth, isVerified: $isVerifiedAlertShowing), isActive: $isVerifiedAlertShowing)
				}
				.padding(.vertical)
				.alert(isPresented: $isUnverifiedAlertShowing){
					Alert(title: Text("SignIn Failed"))
				}
				
				
				
				
			}
			
				.animation(.easeIn)
			.navigationBarTitle("LogIn", displayMode: .inline)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
