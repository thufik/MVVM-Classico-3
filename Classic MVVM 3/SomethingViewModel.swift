//
//  SomethingViewModel.swift
//  Classic MVVM 3
//
//  Created by EquipeSuporteAplicacao on 8/7/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class SomethingViewModel: NSObject {
    
    var somethingList : [Something] = []{
        didSet{
            self.updateList!()
        }
    }
    
    var updateList : (() -> ())?
    
    lazy var model = SomethingModel()
    
    func numberOfRows() -> Int{
        if somethingList.count == 0{
            somethingList = model.fetchSomethingList()
        }
        
        return somethingList.count
    }
    
    func titleForCell(index : Int) -> String {
        return somethingList[index].title
    }
    
    func something(index : Int) -> Something{
        return somethingList[index]
    }
    
    func addSomething(something : Something){
        somethingList.append(something)
    }
    
    func editSomething(index : Int, something : Something){
        somethingList[index] = something
    }
}
