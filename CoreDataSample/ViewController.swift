//
//  ViewController.swift
//  CoreDataSample
//
//  Created by N on 2016/02/11.
//  Copyright © 2016年 Nakama. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITextFieldDelegate {
    
    //CoreData
    let appDelegate
    = UIApplication.sharedApplication().delegate as! AppDelegate
    
    //UIパーツ
    let textField = UITextField(frame: CGRectMake(20,40,200,40))
    let label = UILabel(frame: CGRectMake(20,80,200,40))
    let writeButton = UIButton(frame: CGRectMake(20,120,100,40))
    let readButton = UIButton(frame: CGRectMake(20,160,100,40))
    let deleteButton = UIButton(frame: CGRectMake(20,200,100,40))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalColor.Orange
        
        self.textField.delegate = self
        self.textField.backgroundColor = GlobalColor.White
        self.view.addSubview(textField)
        
        self.label.backgroundColor = GlobalColor.WhiteGray
        //self.label.sizeToFit()
        self.label.text = "データを表示します"
        self.view.addSubview(self.label)
        
        self.writeButton.setTitle("write", forState: UIControlState.Normal)
        self.writeButton.addTarget(self, action: "writeData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(writeButton)
        
        self.readButton.setTitle("read", forState: UIControlState.Normal)
        self.readButton.addTarget(self, action: "readData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(readButton)
        
        self.deleteButton.setTitle("delete", forState: UIControlState.Normal)
        self.deleteButton.addTarget(self, action: "deleteData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(deleteButton)
        
    }
    
    //書き込み
    func writeData(){
        
        guard let text = textField.text else {
            print("no text in the field")
            return
        }
        if text == "" {
            print("blank field")
        } else {
            writeCoreData(text)
        }
        
    }
    
    func writeCoreData(text:String){
        let managedObjectContext = appDelegate.managedObjectContext

        let request = NSFetchRequest(entityName: "DataStore")
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try managedObjectContext.executeFetchRequest(request)
            if results.count > 0{
                let object = results[0] as! NSManagedObject
                let oldText = object.valueForKey("text") as! String
                object.setValue(text, forKey: "text")
                let oldDate = object.valueForKey("date") as! NSDate
                let date = NSDate()
                object.setValue(date, forKey: "date")
                print("Update \(oldText) to \(text)")
                print("Update \(oldDate) to \(date)")
                
                do{
                    try appDelegate.managedObjectContext.save()
                    print("Saving Success")
                }catch{
                    let nserror = error as NSError
                    print("Saving Failure: \(nserror.localizedDescription)")
                }
                
            }else{
                let entity = NSEntityDescription.entityForName("DataStore", inManagedObjectContext: managedObjectContext)
                let object = DataStore(entity: entity!,insertIntoManagedObjectContext: managedObjectContext)
                object.setValue(text, forKey: "text")
                let date = NSDate()
                object.setValue(date, forKey: "date")
                print("Insert \(text)")
                print("Insert \(date)")
                
                do{
                    try appDelegate.managedObjectContext.save()
                    print("Saving Success")
                }catch{
                    let nserror = error as NSError
                    print("Saving Failure: \(nserror.localizedDescription)")
                }
            }
        }catch{
            let nserror = error as NSError
            print("Fetch error: \(nserror.localizedDescription)")
        }
    }
    
    //読み込み
    func readData(){
        self.readCoreData()
    }
    
    func readCoreData(){
        let managedObjectContext = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: "DataStore")
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try  managedObjectContext.executeFetchRequest(request) as! [DataStore]
            if results.count > 0{
                let result = results[0]
                print("\(result.text)")
                guard let date = result.date else{
                    print("No Date data is included")
                    return
                }
                let stringDate = String(date)
                print(stringDate)
                label.text = "\(result.text!)" + "\n" + "\(stringDate)"
            }else{
                print("No Data")
            }
            
        }catch{
            let nserror = error as NSError
            print("Fetal error:\(nserror)")
        }
    }
    
    //削除
    func deleteData(){
        self.deleteCoreData()
    }
    
    func deleteCoreData(){
        let managedObjectContext = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: "DataStore")
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try managedObjectContext.executeFetchRequest(request) as! [DataStore]
            if results.count > 0{
                let count = results.count
                for i in 0 ..< count{
                    let object = results[i]
                    let text = object.valueForKey("text") as! String
                    print("Delete \(text) and Time stamp")
                    managedObjectContext.deleteObject(object)
                    appDelegate.saveContext()
                    print("Delete Success")
                }
                label.text = ""
            }
        }catch let nserror as NSError{
            print("fetch eroor:\(nserror.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
