//
//  ThirdView.swift
//  Firebase Net
//
//  Created by administrator on 02/09/2021.
//

import SwiftUI

struct ThirdView: View {
	@Environment(\.presentationMode) var pm
	@State private var enroll = ""
	@State private var name = ""
	@State private var isButtonEnable = false
    var body: some View {
		VStack{
		VStack(alignment: .center, spacing: 30) {
			TextField("Enrollment", text: $enroll)
			TextField("Name", text: $name, onCommit: {isButtonEnable.toggle()})
		}
		.textFieldStyle(RoundedBorderTextFieldStyle())
		.padding(.horizontal, 40)
			
			Button("Save", action: {
				let user = User(enroll: self.enroll, id: "fkjvoisj", name: self.name)
				let db = FireDBModel()
				db.add_user(user: user)
				pm.wrappedValue.dismiss()
				
			})
			.disabled(isButtonEnable)
		}
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
