//
//  NoteListVC.swift
//  MyToDoList
//
//  Created by kadir on 18.01.2023.
//

import UIKit

class NoteListVC: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
//        let cell =  self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//
//
        var content = cell.defaultContentConfiguration()
        content.text = "title \(indexPath.row)"
        cell.contentConfiguration = content
//
            return cell
     
    }
    
    var topBarTitle : String?

    
    private let tableView : UITableView = {
       var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLayoutSubviews() {
        initPage()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    
    
    func initPage(){
        self.navigationController?.navigationBar.topItem?.title = topBarTitle
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))

        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
        
            tableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height),

        ])
        
        
    }
    
    @objc func add(){
        let nextVC = CreateNoteVC()
//        nextVC.modalPresentationStyle = .fullScreen
//        nextVC.navigationController?.isToolbarHidden = false
//        nextVC.navigationController?.navigationBar.topItem?.title = "Kategori Ekle"
//        self.navigationController?.pushViewController(nextVC, animated: true)
        
          self.present(nextVC, animated: true)
    }

    

}
