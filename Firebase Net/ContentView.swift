//
//  ContentView.swift
//  Firebase Net
//
//  Created by administrator on 30/08/2021.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
	@State private var username = ""
	@State private var password = ""
	@State private var isVerifiedAlertShowing = false
	@State private var isUnverifiedAlertShowing = false
	
	var auth = Auth.auth()
    var body: some View {
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
		}
		.padding(.vertical
		)
		.alert(isPresented: $isVerifiedAlertShowing){
			Alert(title: Text("SignIn Successful"))
		}
		
		
		Button(action:{do{
			try auth.signOut()}
		catch{
			print("Failed to signout")
		}}){
			Text("Sign Out")
				.frame(width: 100, height: 50, alignment: .center)
				.background(Color.red)
				.foregroundColor(.white)
				.clipShape(Capsule())
		}
		.alert(isPresented: $isUnverifiedAlertShowing){
			Alert(title: Text("SignIn Failed"))
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
