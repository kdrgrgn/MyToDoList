//
//  ViewController.swift
//  MyToDoList
//
//  Created by kadir on 14.01.2023.
//

import UIKit
import FirebaseCore

private let itemsPerRow: CGFloat = 2
private var toDoListVM: ToDoListViewModel! = ToDoListViewModel()


private let sectionInsets = UIEdgeInsets(
  top: 20,
  left: 15,
  bottom: 20,
  right: 15)


class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toDoListVM.categoryList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               
        if let cell =  self.collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CollectionViewCell{

            cell.category = toDoListVM.categoryList[indexPath.row]
            
            return cell
        } else {
            return UICollectionViewCell()
        }

        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = NoteListVC()
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.navigationController?.isToolbarHidden = false
        nextVC.category = toDoListVM.categoryList[indexPath.row]
        
        self.navigationController?.pushViewController(nextVC, animated: true)

    }

    
    
  

    @IBOutlet weak var collectionView: UICollectionView!
    
    

    
    private let myActivityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        
       
              
              // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        indicator.hidesWhenStopped = true
              
              // Start Activity Indicator
        indicator.startAnimating()
        return indicator
    }()
   
    
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
     //   FirebaseApp.configure()
         initPage()
    

    }
    

    
    
    
    func initPage() {
        myActivityIndicator.center = view.center
        view.addSubview(myActivityIndicator)
        
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Kategoriler"
        self.collectionView.isHidden = true
        self.collectionView.refreshControl = UIRefreshControl()
        self.collectionView.refreshControl?.addTarget(self, action: #selector(getData), for: .valueChanged)
        
        
        // replace add with your function
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getData()
        

    }
    
    @objc func getData()  {
            Task {
                        await toDoListVM.getCategories()
                DispatchQueue.main.async{
                    print("cekilidiii")

                    self.collectionView.reloadData()
                    self.collectionView.isHidden = false
                    self.myActivityIndicator.stopAnimating()
                    self.collectionView.refreshControl?.endRefreshing()
                  }
                }

         
        }
    

    @objc func add(){
        let nextVC = CreateCategoryVC()
//        nextVC.modalPresentationStyle = .fullScreen
//        nextVC.navigationController?.isToolbarHidden = false
//        nextVC.navigationController?.navigationBar.topItem?.title = "Kategori Ekle"
//        self.navigationController?.pushViewController(nextVC, animated: true)
        
          self.present(nextVC, animated: true)
    }


    
}



extension ViewController: UICollectionViewDelegateFlowLayout {
  // 1
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    // 2
    let paddingSpace = sectionInsets.left * (itemsPerRow)
//    let availableWidth = view.frame.width
    let widthPerItem = collectionView.frame.width / 2 - paddingSpace
    
      return CGSize(width: widthPerItem, height: widthPerItem+50)
  }
  
  // 3
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    return sectionInsets
  }
  
  // 4
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return sectionInsets.left
  }
}
