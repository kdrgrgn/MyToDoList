//
//  Category.swift
//  MyToDoList
//
//  Created by kadir on 14.01.2023.
//

import Foundation
import UIKit






class Category {
    var title : String
    var color : UIColor?
    
    init(title: String, color: UIColor) {
        self.title = title
        self.color = color
    }
    
     func toJson() -> Dictionary<String, Any> {
        var json = Dictionary<String, Any>()
         json["title"] = self.title
         if self.color != nil {
             json["color"] = Color(color: self.color!).toJson()

         }
        return json
        
    }
    
    
    
    func fromJson(json : Dictionary<String, Any>) -> Category {
        self.title =  json["title"] as! String
        
        if json["color"] != nil {
            self.color = jsonToUIColor(json: json["color"] as! Dictionary<String, Any>)
        }
       
        return self
       
   }
    
    func jsonToUIColor(json : Dictionary<String, Any>) -> UIColor {
        let uiColor = UIColor(ciColor: CIColor(red: json["r"] as! CGFloat, green: json["g"] as! CGFloat, blue: json["b"] as! CGFloat, alpha: json["a"] as! CGFloat))
        

        return uiColor
         
     }
    
}




class Color {
    
     let color : UIColor
    
    init(color: UIColor) {
        self.color = color
    }

   func toJson() -> Dictionary<String, Any>  {
       var json = Dictionary<String, Any>()
       json["r"] = color.ciColor.red
       json["g"] = color.ciColor.green
       json["b"] = color.ciColor.blue
       json["a"] = color.ciColor.alpha
       return json
        
    }
    

    
}
