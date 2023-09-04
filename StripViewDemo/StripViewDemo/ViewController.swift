//
//  ViewController.swift
//  StripViewDemo
//
//  Created by apple on 2023/9/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let stripView = StripeyView(frame: CGRect(x: 100, y: 100, width: 200, height: 80))
        stripView.backgroundColor = .red
        stripView.lineColor = .green
        stripView.lineWidth = 10.0
        view.addSubview(stripView)
    }


}

