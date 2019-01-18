//
//  EditSomethingViewModel.swift
//  Classic MVVM 3
//
//  Created by EquipeSuporteAplicacao on 8/7/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Foundation

class EditSomethingViewModel: NSObject {

    var titleBind : ((String) -> ())?
    
    var subtitleBind : ((String) -> ())?
    
    var popNavigation : (() -> ())?

    var something : Something? = nil{
        didSet{
            titleBind!((something?.title)!)
            subtitleBind!((something?.subtitle)!)
        }
    }
    
    var shouldPop : Bool = false{
        didSet{
            if shouldPop{
                popNavigation!()
            }
        }
    }
    
    func editSomething(index : Int, somethingViewModel : SomethingViewModel){
        shouldPop = true
        somethingViewModel.editSomething(index: index, something: self.something!)
    }
}
