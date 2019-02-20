//
//  ViewController4.swift
//  Rate app
//
//  Created by Megan Jinks on 26/12/2018.
//  Copyright © 2018 Megan Jinks. All rights reserved.
//

import UIKit
import SQLite3

var db: OpaquePointer?

class ViewController4: UIViewController {
    
    @IBOutlet weak var LabelUsername: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createObservers()
        
    }
    
    //deinit {
      // NotificationCenter.default.removeObserver(self)
    //}
    
    func createObservers(){

        NotificationCenter.default.addObserver(forName: ID_TRANSFER, object: nil, queue: nil){
            notification in
            
            if let object = notification.object as? [String: Any]{
                if let currentid = object["UserID"] as? Int {
                    print(currentid, "read in VC4")
                    
                    
                    
                    let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                        .appendingPathComponent("RateappDatabase4.sqlite")
                    
                    if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
                        print("error opening database")
                        return
                        
                        
                    } else {
                        print("database open VC4")
                        
                    }
                    
                    var statement: OpaquePointer?
                    
                    if sqlite3_prepare(db, "select UserID, Username from UserDetails", -1, &statement, nil) != SQLITE_OK {
                        let errmsg = String(cString: sqlite3_errmsg(db)!)
                        print("error preparing select: \(errmsg)")
                    }
                    
                    while sqlite3_step(statement) == SQLITE_ROW {
                        let UserID = sqlite3_column_int(statement, 0)
                        print("UserID = \(UserID); ", terminator: "")
                        
                        if let cString = sqlite3_column_text(statement, 1) {
                            let Username = String(cString: cString)
                            if (UserID == currentid){
                            print(UserID, Username)
                            self.LabelUsername.text = Username
                                sqlite3_reset(statement)
                                
                                if sqlite3_finalize(statement) != SQLITE_OK {
                                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                                    print("error finalizing prepared statement: \(errmsg)")
                                        
                                    }
                                statement = nil
                                
                                if sqlite3_close(db) != SQLITE_OK {
                                    print("error closing database")
                                }else{
                                    print("database close VC4")
                                   // let object: [String: Any] = ["UserID": UserID]
                                    //NotificationCenter.default.post(name: ID_TRANSFER, object: object)
                            }
                                db = nil
                        }
                    }
                        
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

}
