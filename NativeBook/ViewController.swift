//
//  ViewController.swift
//  NativeBook
//
//  Created by Pavel Sharanda on 02/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.adjustsFontForContentSizeCategory = true
//        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
//        button.setTitle("Press me", for: .normal)
//        button.setTitleColor(UIColor.label, for: .normal)
//        
//        view.addSubview(button)
//        
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello World"
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}

