//
//  CreateNoteVC.swift
//  MyToDoList
//
//  Created by kadir on 18.01.2023.
//

import UIKit

class CreateNoteVC: UIViewController {
    
    
    private let titleLabel: UILabel = {
      let label = UILabel()
        label.textAlignment = .center
        label.text = "Kategori Oluştur"
        label.font = UIFont.systemFont(ofSize: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    
    private let titleField : UITextField = {
        var field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Not Başlığı"
        field.layer.cornerRadius = 15
        field.layer.borderWidth = 0.2
        return field
    }()
    
    private let contentField : UITextField = {
        var field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "İçerik"
        field.layoutMargins.left = 15
        field.layoutMargins.right = 15
        field.layer.cornerRadius = 15
        field.layer.borderWidth = 0.2
        
        return field
    }()
    
    
    private lazy var createButton : UIButton = {
        let _button = UIButton()
        _button.backgroundColor = .systemBlue
        _button.setTitle("Not Oluştur", for: .normal)
        _button.setTitleColor(.white, for: .normal)
        _button.layer.cornerRadius = 20

        _button.addTarget(self, action: #selector(createNote), for: .allEvents)
        _button.translatesAutoresizingMaskIntoConstraints = false

        return _button
    }()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
initPage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "Not Oluştur"
        view.addSubview(titleField)
        view.addSubview(contentField)
        view.addSubview(createButton)
        view.addSubview(titleLabel)

    }
    
  func  initPage(){
        
      NSLayoutConstraint.activate([
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        titleLabel.heightAnchor.constraint(equalToConstant: 50),
        titleLabel.widthAnchor.constraint(equalToConstant: 150),
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        
        
        titleField.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 50),
        titleField.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
        titleField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        titleField.heightAnchor.constraint(equalToConstant: 50.0),
        
        contentField.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 50),
        contentField.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
        contentField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        contentField.heightAnchor.constraint(equalToConstant: 300.0),

        createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        createButton.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
        createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        createButton.heightAnchor.constraint(equalToConstant: 75),
      
      ])
        
        
        
    }
    @objc func createNote(){
        
    }
 

}
