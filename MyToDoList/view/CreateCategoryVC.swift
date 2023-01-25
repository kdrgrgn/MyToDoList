//
//  CreateCategoryVC.swift
//  MyToDoList
//
//  Created by kadir on 17.01.2023.
//

import UIKit

class CreateCategoryVC: UIViewController {

    
    private var toDoListVM: ToDoListViewModel! = ToDoListViewModel()

    
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
        field.placeholder = "Kategori Başlığı"
        field.textAlignment = NSTextAlignment.center
        field.layer.cornerRadius = 15
        field.layer.borderWidth = 0.2
        field.translatesAutoresizingMaskIntoConstraints = false

        return field
    }()
    
    private lazy var  createButton : UIButton = {
        let _button = UIButton()
        _button.backgroundColor = .systemBlue
        _button.setTitle("Kategori Oluştur", for: .normal)
        _button.setTitleColor(.white, for: .normal)
        _button.layer.cornerRadius = 20

        _button.addTarget(self, action: #selector(createCategory), for: .touchDown)
        _button.translatesAutoresizingMaskIntoConstraints = false

        return _button
    }()

    private lazy var selectColorButton : UIButton = {
        let _button = UIButton()
        _button.setTitle("Renk Değiştir", for: .normal)
        _button.setTitleColor(.systemBlue, for: .normal)
        _button.addTarget(self, action: #selector(setColor), for: .allEvents)
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
        
        view.addSubview(titleField)
        view.addSubview(createButton)
        view.addSubview(selectColorButton)
        view.addSubview(titleLabel)

        // Do any additional setup after loading the view.
    }
    
    func initPage(){
   

        

            
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
                
                
                
                
            titleField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleField.heightAnchor.constraint(equalToConstant: 50),
            titleField.widthAnchor.constraint(equalToConstant: 150),
            titleField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            
            selectColorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectColorButton.heightAnchor.constraint(equalToConstant: 50),
            selectColorButton.widthAnchor.constraint(equalToConstant: 150),
            selectColorButton.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 30),
            
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.heightAnchor.constraint(equalToConstant: 50),
            createButton.widthAnchor.constraint(equalToConstant: 200),
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        
        ])
    }
    
    
    @objc func setColor() {
        let picker = UIColorPickerViewController()
        picker.selectedColor = self.view.backgroundColor!
        picker.delegate = self

        //  Subscribing selectedColor property changes.
     
        _ =  picker.publisher(for: \.selectedColor)
            .sink { color in
                print("Color degistii")
                //  Changing view color on main thread.
                DispatchQueue.main.async {
                    self.view.backgroundColor = color
                }
            }
        
        self.present(picker, animated: true, completion: nil)
    }
    
    
    @objc func createCategory() {
        DispatchQueue.main.async {
            self.toDoListVM.createCategory(category: Category(title: self.titleField.text,color: self.view.backgroundColor))

        }
        self.dismiss(animated: true)
        
        
    }

}


extension CreateCategoryVC: UIColorPickerViewControllerDelegate {
    
    //  Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.view.backgroundColor = viewController.selectedColor
        
    }
    
    //  Called on every color selection done in the picker.
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            self.view.backgroundColor = viewController.selectedColor
    }
}
