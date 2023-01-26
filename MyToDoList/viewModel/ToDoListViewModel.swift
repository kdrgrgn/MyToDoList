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
    var noteList : [Note] = []

    //    let categoryDetail : Category? = nil

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
    
    func getNotes(id : String) async  {
        
               // Task {
            do {
                let snapshot = try await db.collection("Notes").whereField("categoryId", isEqualTo: id).getDocuments()
             
                       self.noteList = []
                for document in snapshot.documents {
                    
                  
                    let data = try JSONSerialization.data(withJSONObject: document.data())
                     let note = try JSONDecoder().decode(Note.self, from: data)
                               self.noteList.append(note)

                           
                       }

            
       
            } catch  {
                print("Error getting documents: \(error)")

            }
       // }
  
    }
    
    
    func createNote(note : Note){
        
        db.collection("Notes").addDocument(data: note.dictionary!) { error in
            if let err = error {
                   print("Error add documents: \(err)")
            }
               
        }
    }
    
    
}


