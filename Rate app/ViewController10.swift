//
//  ViewController10.swift
//  Rate app
//
//  Created by Megan Jinks on 30/12/2018.
//  Copyright © 2018 Megan Jinks. All rights reserved.
//

import UIKit
import Vision
import SQLite3




class ViewController10: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        enterPrice1.delegate = self
        enterBrand.delegate = self
        enterProduct1.delegate = self
        enterComment.delegate = self
        
        
        var fileUrl = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("RateappDatabase4.sqlite")
        
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print("Error opening database")
            
            print(fileUrl = try!
                FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("RateappDatabase4.sqlite"))
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
            
        }        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        
    }
    
    @IBOutlet weak var enterPrice1: UITextField!
    @IBOutlet weak var enterComment: UITextField!
    @IBOutlet weak var enterBrand: UITextField!
    @IBOutlet weak var enterProduct1: UITextField!
    
    @IBAction func lipstick1(_ sender: Any) {
        
        var stmt: OpaquePointer?

        let queryString3 = "INSERT INTO Rate (rating, UserID) VALUES (?, ?)"
        
        let lipstickValue1 = 1
        
        if sqlite3_prepare(db, queryString3, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
            
        }
        if sqlite3_bind_int(stmt, 1, Int32(lipstickValue1)) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting lipstick1: \(errmsg)")
            return
        }
       // if sqlite3_bind_int(stmt, 2, Int32(currentid)) != SQLITE_OK{
       //     let errmsg = String(cString: sqlite3_errmsg(db)!)
       //     print("failure inserting lipstick1: \(errmsg)")
       //     return
      //  }
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding lipstick1: \(errmsg)")
            return
        }
        print("rating of 1")
    }
    
    @IBAction func lipstick2(_ sender: Any) {
        
        var stmt: OpaquePointer?
        
        let queryString4 = "INSERT INTO Rate (rating) VALUES (?)"
        
        let lipstickValue2 = 2
        
        if sqlite3_prepare(db, queryString4, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
            
        }
        if sqlite3_bind_int(stmt, 1, Int32(lipstickValue2)) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting lipstick1: \(errmsg)")
            return
        }
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding lipstick2: \(errmsg)")
            return
        }
        print("rating of 2")
        
    }
    
    @IBAction func lipstick3(_ sender: Any) {
        
        var stmt: OpaquePointer?
        
        let queryString5 = "INSERT INTO Rate (rating) VALUES (?)"
        
        let lipstickValue3 = 3
        
        if sqlite3_prepare(db, queryString5, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
            
        }
        if sqlite3_bind_int(stmt, 1, Int32(lipstickValue3)) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting lipstick3: \(errmsg)")
            return
        }
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding lipstick3: \(errmsg)")
            return
        }
        print("rating of 3")
        
    }
    @IBAction func lipstick4(_ sender: Any) {
        
        var stmt: OpaquePointer?
        
        let queryString6 = "INSERT INTO Rate (rating) VALUES (?)"
        
        let lipstickValue4 = 4
        
        if sqlite3_prepare(db, queryString6, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
            
        }
        if sqlite3_bind_int(stmt, 1, Int32(lipstickValue4)) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting lipstick4: \(errmsg)")
            return
        }
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding lipstick4: \(errmsg)")
            return
        }
        print("rating of 4")
        
    }
    @IBAction func lipstick5(_ sender: Any) {
        
        var stmt: OpaquePointer?
        
        let queryString7 = "INSERT INTO Rate (rating) VALUES (?)"
        
        let lipstickValue5 = 5
        
        if sqlite3_prepare(db, queryString7, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
            
        }
        if sqlite3_bind_int(stmt, 1, Int32(lipstickValue5)) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting lipstick5: \(errmsg)")
            return
        }
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding lipstick5: \(errmsg)")
            return
        }
        print("rating of 5")
        
    }
    
    
    @IBAction func postButton1(_ sender: Any) {
        
        
        let price = enterPrice1.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let comment = enterComment.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let product = enterProduct1.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let brand = enterBrand.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        saveImage(imageName: brand! + product!)
        

        if(price?.isEmpty)!{
            enterPrice1.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if(comment?.isEmpty)!{
            enterComment.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if(product?.isEmpty)!{
            enterProduct1.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if(brand?.isEmpty)!{
            enterBrand.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        else{
            
            var stmt: OpaquePointer?
            
            let queryString = "INSERT INTO Product (product, brand, price) VALUES (?,?,?)"
            let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
            
            if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing insert: \(errmsg)")
                return
            
            }
            
            if sqlite3_bind_text(stmt, 1, product, -1, SQLITE_TRANSIENT) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding product: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 2, brand, -1, SQLITE_TRANSIENT) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding brand: \(errmsg)")
                return
            }
            
            if sqlite3_bind_int(stmt, 3,(price!as NSString).intValue) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding price: \(errmsg)")
                return
            }
            
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding product info: \(errmsg)")
                return
            }
            
            enterBrand.text=""
            enterProduct1.text=""
            enterPrice1.text=""
            enterComment.text=""
            
            print("product info saved successfully")
            
            let queryString2 = "INSERT INTO Comment (comment) VALUES (?)"
            
            if sqlite3_prepare(db, queryString2, -1, &stmt, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing insert: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 1, product, -1, SQLITE_TRANSIENT) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding comment: \(errmsg)")
                return
            }
            
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding comment info: \(errmsg)")
                return
            }
            
            
            print("comment saved successfully")
            
            
        }
        
        
        
    }
    
    var db: OpaquePointer?

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
  
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    func saveImage(imageName: String){
        //create an instance of the FileManager
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        print(imagePath)
        //get the image we took with camera
        let image = imageView.image!
        //get the PNG data for this image
        let data = image.pngData()
        //store it in the document directory    fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
        var stmt: OpaquePointer?
        
        let queryString3 = "INSERT INTO Post (Post) VALUES (?)"
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        if sqlite3_prepare(db, queryString3, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, imagePath, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding image: \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding image: \(errmsg)")
            return
        }
        
        print("Image saved successfully")
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
