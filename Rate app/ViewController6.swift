//
//  ViewController6.swift
//  Rate app
//
//  Created by Megan Jinks on 29/12/2018.
//  Copyright © 2018 Megan Jinks. All rights reserved.
//

import UIKit

class ViewController6: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: ID_TRANSFER, object: nil, queue: nil){
            notification in
            
            if let object = notification.object as? [String: Any]{
                if let currentid = object["UserID"] as? Int {
                    print(currentid, "crap it works")
                    
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
