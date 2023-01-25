//
//  Category.swift
//  MyToDoList
//
//  Created by kadir on 14.01.2023.
//

import Foundation
import UIKit






class Category {
    var id : String!
    var title : String?
    var color : UIColor?
    
    init(title: String?, color: UIColor?) {
        self.id = UUID().uuidString
        self.title = title
        self.color = color
    }
    
     func toJson() -> [String : Any]{

         return  [
         
            "id" : self.id ??  UUID().uuidString,
            "title" : self.title ?? "",

            "color" : Color(color: self.color ?? .white).toJson()

          


         ]
        
    }
    
    
    
    static func fromJson(json : [String : Any]) -> Category? {
        let category = Category(title: nil, color: nil)
       category.title =  json["title"] as? String
        category.id =  json["id"] as? String

        if json["color"] != nil {
            category.color = jsonToUIColor(json: json["color"] as! [String : Any])
        }
       
        return category
   }
    

    
}




class Color {
    
     let color : UIColor
    
    init(color: UIColor) {
        self.color = color
    }

   func toJson() ->  [String : Any]  {
       let ciColor : CIColor = CIColor(color: color)
       return  [
       
        "r" : ciColor.red,
        "g" : ciColor.green,
        "b" : ciColor.blue,
        "a" : ciColor.alpha


       ]
   
        
    }
    

    
}




func jsonToUIColor(json : [String : Any]) -> UIColor {
    let uiColor = UIColor(ciColor: CIColor(red: json["r"] as! CGFloat, green: json["g"] as! CGFloat, blue: json["b"] as! CGFloat, alpha: json["a"] as! CGFloat))
    

    return uiColor
     
 }
