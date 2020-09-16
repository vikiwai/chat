//
//  ViewController.swift
//  Chat
//
//  Created by vikiwai on 16.09.2020.
//  Copyright © 2020 vikiwai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let logger = Logger(true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logger.logViewLifecycle(functionName: #function)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        logger.logViewLifecycle(functionName: #function)
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        logger.logViewLifecycle(functionName: #function)
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        logger.logViewLifecycle(functionName: #function)
    }

    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        logger.logViewLifecycle(functionName: #function)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        logger.logViewLifecycle(functionName: #function)
    }
}

