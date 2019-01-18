//
//  AddSomethingViewController.swift
//  Classic MVVM 3
//
//  Created by EquipeSuporteAplicacao on 8/7/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class EditSomethingViewController: UIViewController {
    
    @IBOutlet weak var txtSomethingTitle: UITextField!
    
    @IBOutlet weak var txtSomethingSubtitle: UITextField!
    
    lazy var editButton : UIBarButtonItem = { () -> UIBarButtonItem in
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.edit))
        //editButton.isEnabled = false
        
        return editButton
    }()
    
    lazy var editViewModel : EditSomethingViewModel = { () -> EditSomethingViewModel in
        let editViewModel = EditSomethingViewModel()
        
        editViewModel.titleBind = { text in
            self.txtSomethingTitle.text = text
        }
        
        editViewModel.subtitleBind = { text in
            self.txtSomethingSubtitle.text = text
        }
        
        editViewModel.popNavigation = {
            self.navigationController?.popViewController(animated: true)
        }
        
        return editViewModel
    }()
    
    var something : Something!
    
    var somethingViewModel : SomethingViewModel!
    
    var index : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = editButton

        editViewModel.something = self.something
        
        txtSomethingTitle.addTarget(self, action: #selector(teste(textField:)), for: .editingChanged)
        txtSomethingSubtitle.addTarget(self, action: #selector(teste2(textfield:)), for: .editingChanged)
    }

    @objc func edit(){
        self.editViewModel.editSomething(index : self.index, somethingViewModel : somethingViewModel)
    }
    
    @objc func teste(textField : UITextField){
        self.editViewModel.something?.title = textField.text!
    }
    
    @objc func teste2(textfield : UITextField){
        self.editViewModel.something?.subtitle = textfield.text!
        
    }
}

