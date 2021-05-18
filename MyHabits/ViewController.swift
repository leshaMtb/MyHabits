//
//  ViewController.swift
//  MyHabits
//
//  Created by Apple on 03.05.2021.
//

import UIKit

class ViewController: UIViewController {

    
    let view1: UIView = {
       let gg = UIView()
        gg.backgroundColor = .brown
        return gg
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.addSubview(view1)
        view1.frame = view.frame
        
    }


}

