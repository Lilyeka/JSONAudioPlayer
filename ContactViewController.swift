//
//  ContactViewController.swift
//  GoodAsPhone
//
//  Created by Dmitry Torshin on 30.11.16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        // Do any additional setup after loading the view.
    }
    
    // Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
    //@available(iOS 5.0, *)
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: 375, height: 800)
    }

}
