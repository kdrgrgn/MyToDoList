//
//  CollectionViewCell.swift
//  MyToDoList
//
//  Created by kadir on 14.01.2023.
//
import UIKit

class CollectionViewCell: UICollectionViewCell {

    var category : Category?
    
    
    @IBOutlet weak var title: UILabel!
    
    
    override func layoutSubviews() {
       super.layoutSubviews()
        //radius
        
        self.layer.cornerRadius = 30
        self.contentView.layer.cornerRadius = 30
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        //radius
        
        
        title.textAlignment = .center
        title.numberOfLines = 3
        title.center = self.contentView.center

        
        if category?.color != nil {
            self.backgroundColor = category?.color
            self.title.textColor = ((category?.color?.isLight()) ?? true) ? .black : .white

        }
        self.title.text = category?.title ?? "hata"
    }
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

            

    }
    
    

}


