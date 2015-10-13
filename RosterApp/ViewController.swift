//
//  ViewController.swift
//  RosterApp
//
//  Created by Francisco Ragland Jr on 10/12/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let peopleFromArchive = self.loadFromArchive() {
            people = peopleFromArchive
        } else {
            let p1 = Person(firstName: "Cisco", lastName: "Ragland")
            let p2 = Person(firstName: "Marina", lastName: "Sanchez")
            let p3 = Person(firstName: "Ean", lastName: "Tatum")
            let p4 = Person(firstName: "Eliot", lastName: "Sipes")
            people.append(p1)
            people.append(p2)
            people.append(p3)
            people.append(p4)
            
            for person in people {
                person.image = UIImage(named: "placeholder")
            }
            
            savetoArchive()
        }
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        saveToArchive()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("segue fired")
        if segue.identifier == "ShowPersonDetail" {
            if let destinationViewController = segue.destinationViewController as? PersonDetailViewController {
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    let selectedRow = selectedIndexPath.row
                    let chosenPerson = people[selectedRow]
                    
                    destinationViewController.selectedPerson = chosenPerson
                }
            }
        } else if segue.identifier == "MyOtherSegue" {
            //customize if going to another view controller
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //1. dequeue the cell
        let cell = dequeueReusableCellWithIdentifier("RosterCell", forIndexPath: indexPath) as! PersonTableViewCell
        //2. configure the cell
        let person = people[indexPath.row]
        
        cell.firstNameLabel.text = person.firstName
        cell.lastNameLabel.text = person.lastName
        cell.personImageView.image = person.image
        
        //3. return the cell
        return cell
    }
    
    func saveToArchive() {
        if let documentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last {
            if let people = NSKeyedUnarchiver.unarchiveObjectWithFile(documentPath + "/archive") as? [Person] {
                return people
            }
        }
        return nil
    }
    

}

