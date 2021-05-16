//
//  Function(函数).swift
//  PPDemo
//
//  Created by AbnerPei on 2021/4/30.
//

import UIKit

class FunctionViewController: UIViewController {
    override func viewDidLoad() {
        
        let a:() -> Void = test1;
        
        a()
    }
    
    func test1() -> Void {
        print("今天天气真好")
    }
}

