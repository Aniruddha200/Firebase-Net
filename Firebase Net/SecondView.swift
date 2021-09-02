//
//  SecondView.swift
//  Firebase Net
//
//  Created by administrator on 02/09/2021.
//

import SwiftUI
import Firebase


struct SecondView: View {
	@Binding var auth: Auth
	@Binding var isVerified: Bool
	@State private var FireDB = FireDBModel()
	@State private var isSheetShowing = false
    var body: some View {
		VStack{
			
			
			Button(action: {
				isSheetShowing.toggle()
			}){
				Text("Add user")
					.frame(width: 150, height: 50, alignment: .center)
					.foregroundColor(.white)
					.background(Color.blue)
					.clipShape(RoundedRectangle(cornerRadius: 30))
			}
			.sheet(isPresented: $isSheetShowing, content: {
				ThirdView()
			})
			
			
			
			.navigationBarTitle("DashBoard", displayMode: .inline)
			.navigationBarItems(trailing: Button("Signout", action: {
				do{
					try auth.signOut()
				   isVerified.toggle()
			   }
					  catch{
					   print("Failed to signout")
				   }
			}))
		}
    }
}


