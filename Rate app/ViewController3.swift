//
//  ViewController3.swift
//  Rate app
//
//  Created by Megan Jinks on 21/12/2018.
//  Copyright © 2018 Megan Jinks. All rights reserved.
//

import UIKit
import SQLite3

class ViewController3: UIViewController {

    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var UsernameInput: UITextField!
    @IBOutlet weak var PasswordInput: UITextField!
    
    
    
    @IBAction func SubmitButton(_ sender: Any) {
        
        let loginName = UsernameInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let loginPassword = PasswordInput.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(loginName?.isEmpty)!{
            UsernameInput.layer.borderColor = UIColor.red.cgColor
            displayMessage(userMessage: "username is missing")
            return}
        
        if(loginPassword?.isEmpty)!{
            PasswordInput.layer.borderColor = UIColor.red.cgColor
            displayMessage(userMessage: "password is missing")
            return}
        
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("RateappDatabase4.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
            print("error opening database")
            return
            
            
        } else {
            print("database open 1")
        }
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, "select UserID, Username, Password from UserDetails", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            let UserID = sqlite3_column_int(statement, 0)
            print("UserID = \(UserID); ", terminator: "")
            
            if let cString = sqlite3_column_text(statement, 1) {
                let Username = String(cString: cString)
                if (Username == loginName){
                    if let cString = sqlite3_column_text(statement, 2) {
                        let Password = String(cString: cString)
                        if (Password == loginPassword){
                            print(Username, Password)
                           
                            sqlite3_reset(statement)
                            
                            if sqlite3_finalize(statement) != SQLITE_OK {
                                let errmsg = String(cString: sqlite3_errmsg(db)!)
                                print("error finalizing prepared statement: \(errmsg)")
                            }
                            
                            statement = nil
                            
                            
                            
                            if sqlite3_close(db) != SQLITE_OK {
                                print("error closing database")
                            }else{
                                print("database closed")
                            }
                            
                            db = nil
                            let object: [String: Any] = ["UserID": UserID]

                            performSegue(withIdentifier: "ToHome", sender: self)
                            NotificationCenter.default.post(name: ID_TRANSFER, object: object)
                            
                        }else{
                            print("wrong details")
                        }
                        
                       
                        
                        
                        
                       
                        
                    }
                }
            }
                
                
        }
        
        
        
            
        
       
    }
    
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "ok", style: .default)
                { (action:UIAlertAction!) in
                    //Code in this block will trigger when OK button tapped
                    print("ok button tapped")
                    DispatchQueue.main.async
                        {
                            
                            self.dismiss(animated: true, completion:nil)
                    }
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            
        
    }
    
}

