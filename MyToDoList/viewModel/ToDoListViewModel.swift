//
//  ToDoListViewModel.swift
//  MyToDoList
//
//  Created by kadir on 22.01.2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel {
    var categoryList : [Category] = []
    let categoryDetail : Category? = nil

    let db = Firestore.firestore()

    
    func getCategories() async  {
        
       // Task {
            do {
                let snapshot = try await db.collection("Category").getDocuments()
             
                       self.categoryList = []
                for document in snapshot.documents {
                           if let categegory = Category.fromJson(json: document.data()) {
                               self.categoryList.append(categegory)

                           }
                       }

            
       
            } catch  {
                print("Error getting documents: \(error)")

            }
       // }
  
    }
    
    
    func createCategory(category : Category){
        
        db.collection("Category").addDocument(data: category.toJson()) { error in
            if let err = error {
                   print("Error add documents: \(err)")
            } 
               
        }
    }
    
}
