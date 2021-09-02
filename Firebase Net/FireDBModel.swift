//
//  FireDBModel.swift
//  Firebase Net
//
//  Created by administrator on 02/09/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FireDBModel: ObservableObject{
	let path = "testCollection"
	let db = Firestore.firestore()
	
	
	func add_user(user: User){
		self.db.collection(path).addDocument(data: ["enroll": user.enroll, "id": user.id, "name": user.name])
	}
}

struct User: Codable{
	let enroll: String
	var id: String
	let name: String
}



