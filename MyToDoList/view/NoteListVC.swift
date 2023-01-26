//
//  NoteListVC.swift
//  MyToDoList
//
//  Created by kadir on 18.01.2023.
//

import UIKit

class NoteListVC: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    private var toDoListVM: ToDoListViewModel! = ToDoListViewModel()
    
    var category : Category?

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListVM.noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")

        var content = cell.defaultContentConfiguration()
        content.text = toDoListVM.noteList[indexPath.row].title
        content.secondaryText = toDoListVM.noteList[indexPath.row].note
        cell.contentConfiguration = content
//
            return cell
     
    }
    

    
    private let tableView : UITableView = {
       var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true
        return table
    }()
    
    private let myActivityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
      indicator.hidesWhenStopped = true
        indicator.startAnimating()
        return indicator
    }()
   
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
          self.navigationController?.navigationBar.topItem?.title = category?.title ?? ""
          self.navigationController?.navigationBar.topItem?.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        myActivityIndicator.center = view.center
        view.addSubview(myActivityIndicator)
        view.addSubview(tableView)
        
        initPage()

    }
    
    
    func initPage(){
 
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(getData), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
        
            tableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height),

        ])
        
        
        getData()
        
    }
    
    
    @objc func getData()  {
            Task {
                await toDoListVM.getNotes(id:category!.id!)
                DispatchQueue.main.async{
                    print("cekilidiii")

                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.myActivityIndicator.stopAnimating()
                    self.tableView.refreshControl?.endRefreshing()
                  }
                }

         
        }
    
    
    
    @objc func add(){
        let nextVC = CreateNoteVC()
        nextVC.categoryId = category?.id

        
          self.present(nextVC, animated: true)
    }

    

}
