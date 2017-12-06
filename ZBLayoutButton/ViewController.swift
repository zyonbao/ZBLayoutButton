//
//  ViewController.swift
//  ZBLayoutButton
//
//  Created by sungrow on 2017/12/5.
//  Copyright © 2017年 picoluster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        for i in 0 ..< 5 {
            let button = ZBLayoutButton.init(type: .custom)//ZBLayoutButton(frame: CGRect(x: 20, y: 20, width: 1, height: 1))
            
            button.imgSize = CGSize(width: 60, height: 60)
            button.textAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            button.contentEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
            button.titleLabel?.font =  UIFont.systemFont(ofSize: 15)
            button.setImage(UIImage(named: "bg"), for: .normal)
            button.setTitle("Title \(i)", for: .normal)
            if 3 == i || 1 == i {
                button.setTitle("Title can be longer", for: .normal)
            }
            button.backgroundColor = UIColor.darkGray
            button.titleLabel?.backgroundColor = .orange
            button.setTitleColor(.white, for: .normal)
            button.setTitleColor(.lightGray, for: .highlighted)
            self.view.addSubview(button)
            switch i {
            case 0:
                button.layoutDirection = .imgLeft
                button.translatesAutoresizingMaskIntoConstraints = false
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .left, relatedBy: .equal, toItem: button, attribute: .left, multiplier: 1.0, constant: -20.0))
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .top, relatedBy: .equal, toItem: button, attribute: .top, multiplier: 1.0, constant: -20.0))
            case 1:
                button.layoutDirection = .imgRight
                button.translatesAutoresizingMaskIntoConstraints = false
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .right, relatedBy: .equal, toItem: button, attribute: .right, multiplier: 1.0, constant: 20.0))
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .top, relatedBy: .equal, toItem: button, attribute: .top, multiplier: 1.0, constant: -20.0))
            case 2:
                button.layoutDirection = .imgTop
                button.translatesAutoresizingMaskIntoConstraints = false
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .left, relatedBy: .equal, toItem: button, attribute: .left, multiplier: 1.0, constant: -20.0))
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1.0, constant: 20.0))
            case 3:
                button.layoutDirection = .imgBottom
                button.translatesAutoresizingMaskIntoConstraints = false
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .right, relatedBy: .equal, toItem: button, attribute: .right, multiplier: 1.0, constant: 20.0))
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1.0, constant: 20.0))
            default:
                button.layoutDirection = .imgTop
                button.padding = 20
                button.translatesAutoresizingMaskIntoConstraints = false
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1.0, constant: 0.0))
                self.view.addConstraint(NSLayoutConstraint.init(item: self.view, attribute: .centerY, relatedBy: .equal, toItem: button, attribute: .centerY, multiplier: 1.0, constant: 0.0))
                button.addConstraint(NSLayoutConstraint.init(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0))
                button.addConstraint(NSLayoutConstraint.init(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0))
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

