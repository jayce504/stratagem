//
//  ViewController.swift
//  Stratagem
//
//  Created by Scott Hudson on 6/3/17.
//  Copyright © 2017 Hudson Legal Services PLLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   @IBOutlet var table: UITableView!
   
    /*
     
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bondLabel: UILabel!
    @IBOutlet var appOrRetLabel: UILabel!
    @IBOutlet var crimesLabel: UILabel!
    
 */
    
    class myCell: UIViewController {
        
        
    }
    
    
    var cases: [String] = []
    
    var crimes: [String] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("return OK")
        
        return cases.count
        
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = cases[indexPath.row]
        
        cell.detailTextLabel?.text = String(crimes.count)
        
        print("Cell assignment OK")
        
        return cell
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let casesObject = UserDefaults.standard.object(forKey: "cases")
        
        if let tempCases = casesObject as? [String] {
            
            cases = tempCases
            
        let crimesObject = UserDefaults.standard.object(forKey: "crimes")
            
        if let tempCrimes = crimesObject as? [String] {
                
            crimes = tempCrimes
                
            }
            
        }
        
        table.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            cases.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(cases, forKey: "cases")
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}




