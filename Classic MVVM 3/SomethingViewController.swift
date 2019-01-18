//
//  ViewController.swift
//  Classic MVVM 3
//
//  Created by EquipeSuporteAplicacao on 8/7/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class SomethingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel : SomethingViewModel = { () -> SomethingViewModel in
        let viewModel = SomethingViewModel()
        viewModel.updateList = {
            self.tableView.reloadData()
        }
        
        return viewModel
    }()
    
    lazy var editView : EditSomethingViewController = { () -> EditSomethingViewController in
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let editView = storyboard.instantiateViewController(withIdentifier: "editSomething") as! EditSomethingViewController
        return editView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SomethingViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = viewModel.titleForCell(index : indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
}

extension SomethingViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let something = viewModel.something(index : indexPath.row)
        editView.something = something
        editView.somethingViewModel = viewModel
        editView.index = indexPath.row
        
        self.navigationController?.pushViewController(editView, animated: true)
    }
}

