//
//  ViewController.swift
//  Rate app
//
//  Created by Megan Jinks on 17/12/2018.
//  Copyright © 2018 Megan Jinks. All rights reserved.
//

import UIKit
import SQLite3
class ViewController: UIViewController {
        
        
        var db: OpaquePointer?
    
        @IBOutlet weak var textfieldlastname: UITextField!
        @IBOutlet weak var textfieldfirstname: UITextField!
        @IBOutlet weak var textfieldEmail: UITextField!
        @IBOutlet weak var textfieldusername: UITextField!
        @IBOutlet weak var textfieldPassword: UITextField!
        @IBOutlet weak var textfieldConfirmPassword: UITextField!
    
    @IBAction func ButtonSave(_ sender: Any) {
        
                
            let firstName = textfieldfirstname.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = textfieldlastname.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Email = textfieldEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Username = textfieldusername.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Password = textfieldPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let ConfirmPassword = textfieldConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
            if(firstName?.isEmpty)!{
                textfieldfirstname.layer.borderColor = UIColor.red.cgColor
                displayMessage(userMessage: "first name is missing")
                return
            }
            if(lastName?.isEmpty)!{
                textfieldlastname.layer.borderColor = UIColor.red.cgColor
                displayMessage(userMessage: "last name is missing")
                return
            }
        
            if (Email?.isEmpty)!{
                textfieldEmail.layer.borderColor = UIColor.red.cgColor
                displayMessage(userMessage: "email is missing")
                return
            }
            if (Username?.isEmpty)!{
                textfieldusername.layer.borderColor = UIColor.red.cgColor
                displayMessage(userMessage: "username is missing")
                return
            }
            if (Password?.isEmpty)!{
                textfieldPassword.layer.borderColor = UIColor.red.cgColor
                displayMessage(userMessage: "password is missing")
                return
            }
            if (ConfirmPassword?.isEmpty)!{
                textfieldConfirmPassword.layer.borderColor = UIColor.red.cgColor
                displayMessage(userMessage: "confirm password is missing")
                return
            }
        
            if(Password != ConfirmPassword){
                print("Passwords don't match")
                displayMessage(userMessage: "passwords don't match")
                
            } else {
                
                
                
            var stmt: OpaquePointer?
        
       
            
            let queryString = "INSERT INTO UserDetails (Firstname, Lastname, Username, Password, Email) VALUES(?, ?, ?, ?, ?)"
            let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to :sqlite3_destructor_type.self)
            
            if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing insert: \(errmsg)")
                return
            }
        
            if sqlite3_bind_text(stmt, 1, firstName, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding firstname: \(errmsg)")
                return
            }
        
            if sqlite3_bind_text(stmt, 2, lastName, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding lastname: \(errmsg)")
                return
            }
        
            if sqlite3_bind_text(stmt, 3, Username, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding username: \(errmsg)")
                return
            }
        
            if sqlite3_bind_text(stmt, 4, Password, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding password: \(errmsg)")
                return
            }
        
            if sqlite3_bind_text(stmt, 5, Email, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding email: \(errmsg)")
                return
            }
        
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding firstName: \(errmsg)")
                return
            }
        
            textfieldfirstname.text=""
            textfieldlastname.text=""
            textfieldusername.text=""
            textfieldPassword.text=""
            textfieldEmail.text=""
        
            print("user saved successfully")
        
            performSegue(withIdentifier: "toLogin2", sender: self)
                
                
        }
            
    }
   
    override func viewDidLoad() {
        
            super.viewDidLoad()
                        
        var fileUrl = try!
                FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("RateappDatabase4.sqlite")
            
            
            if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
                print("Error opening database")
                
                print(fileUrl = try!
                    FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("RateappDatabase4.sqlite"))
            }
        
        
        
            
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS UserDetails (UserID INTEGER PRIMARY KEY AUTOINCREMENT, Firstname TEXT, Lastname TEXT, Username TEXT, Password TEXT, Email TEXT, PostID INTEGER)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
            
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Rate (RateID INTEGER PRIMARY KEY AUTOINCREMENT, rating INTEGER, UserID INTEGER, ProductId INTEGER, PostID INTEGER)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
            
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Product (ProductID INTEGER PRIMARY KEY AUTOINCREMENT, product TEXT, UserID INTEGER, brand TEXT, price INTEGER, PostID INTEGER)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
            
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Comment (CommentID INTEGER PRIMARY KEY AUTOINCREMENT, comment TEXT, UserID INTEGER, orderCom INTEGER, PostID INTEGER)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
            
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Post (PostID INTEGER PRIMARY KEY AUTOINCREMENT, ProductID INTEGER, UserID INTEGER, RateID INTEGER, CommentID INTEGER, Post TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
            
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
    
        
    }
    
   
    

