//
//  StoryView.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/16/20.
//

import UIKit
import SnapKit
import RxSwift

class StoryView: UIViewController {

    //MARK: - Local Properties
    let viewModel = StoryViewModel()

    //MARK: - UI Properties
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    //MARK - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.viewModel.getStories()
        configureTableView()
        setupUI()
        setupAction()
    }
    
    //MARK:- Methods
    func setupUI() {
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
    }
    
    func setupAction() {
        
    }
    
    func configureTableView() {
        self.tableView.register(StoryCell.self, forCellReuseIdentifier: "Cell")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
