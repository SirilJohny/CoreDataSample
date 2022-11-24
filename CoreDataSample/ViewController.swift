//
//  ViewController.swift
//  CoreDataSample
//
//  Created by DDUKK on 24/11/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var score = Int()

    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func increasescore(_ sender: Any) {
        score+=1
        scoreLabel.text = "\(score)"
        }
        
        @IBAction func Save(_ sender: Any) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Entity", in:context)
            let newEntity = NSManagedObject(entity:entity!,insertInto:context)
            newEntity.setValue(score, forKey: "number")
            
            do{
                try context.save()
                print("Saved")
                
            }
            catch{
                print("Failed")
                
                
            }
            
        }
        func getData(){
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Entity")
            request.returnsObjectsAsFaults = false
            
            do{
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject]{
                    score = data.value(forKey:"number")as! Int
                }
            }catch{
                print("Failed")
            }
            
            
        }
    }


