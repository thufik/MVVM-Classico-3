//
//  SomethingModel.swift
//  Classic MVVM 3
//
//  Created by EquipeSuporteAplicacao on 8/7/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class SomethingModel: NSObject {
    
    func fetchSomethingList() -> [Something]{
        var somethingList : [Something] = []
        
        for i in 0...5{
            let something = Something(title: "Something title\(i)", subtitle: "Something subtitle\(i)")
            somethingList.append(something)
        }
        
        return somethingList
    }
}
