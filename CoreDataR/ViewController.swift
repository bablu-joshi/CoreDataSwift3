//
//  ViewController.swift
//  CoreDataR
//
//  Created by Bablu Joshi on 09/08/17.
//  Copyright © 2017 Qa infotech. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appdelObj:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        
        let personEntity =  NSEntityDescription.entity(forEntityName: "Person", in: appdelObj.persistentContainer.viewContext)
        
        let person = NSManagedObject(entity: personEntity!, insertInto: appdelObj.persistentContainer.viewContext)
        
        person.setValue("8802778540", forKey: "cellno")
        person.setValue("Bablu Joshi", forKey: "name")
        
        
        let courseEntity =  NSEntityDescription.entity(forEntityName: "Course", in: appdelObj.persistentContainer.viewContext)
        
        let courseObj = NSManagedObject(entity: courseEntity!, insertInto: appdelObj.persistentContainer.viewContext)
        
        courseObj .setValue("big nerds", forKey: "bookname")
        courseObj .setValue("10000", forKey: "fees")
        courseObj .setValue("IOS-DEV-Weekly", forKey: "name")
        courseObj .setValue("15 august", forKey: "startDate")
        
        //courseObj .setValue(person, forKey: "person")
        person .setValue(courseObj, forKey: "course")
        appdelObj.saveContext()

        /* fetching */
        
        let moc = appdelObj.persistentContainer.viewContext
        let employeesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        do {
            let fetchedPerson = try moc.fetch(employeesFetch) as! [Person]
            for managedObject in fetchedPerson {
                
                if let nameUser = managedObject.value(forKey: "name"),let cellno = managedObject.value(forKey: "cellno") {
                    
                    let courseObj:Course = managedObject.value(forKey: "course") as! Course
                    
                    
                    if let fee = courseObj.value(forKey: "fees"),let bookName = courseObj.value(forKey: "bookname"),let name = courseObj.value(forKey: "name"),let stdate = courseObj.value(forKey: "startDate"){
                        
                        print("\n\n\n name is \(nameUser)\n cell no is ->\n \(cellno) \n\n\n Course : fee \(fee) book name is \(bookName) course name is \(name)start date is \(stdate) " )
                        
                    }
                }
                
            }
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

