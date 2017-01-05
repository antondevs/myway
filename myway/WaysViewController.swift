//
//  ViewController.swift
//  myway
//
//  Created by antondev on 05/01/17.
//  Copyright © 2017 engune. All rights reserved.
//

import UIKit

class WaysViewController: UITableViewController {
    
    var routes:[Route] = []

    @IBAction func onAddRoute(_ sender: Any) {
        let alert = UIAlertController(title: "My Way", message: "Enter Name", preferredStyle:
            UIAlertControllerStyle.alert)
        
        alert.addTextField(configurationHandler: textFieldHandler)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            let field:UITextField? = alert.textFields?.first
            let route = DataLayer.sharedInstance.addRoute(name: (field?.text)!)
            self.routes.append(route)
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            // Nothing
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
    func textFieldHandler(textField: UITextField!)
    {
        if (textField) != nil {
            textField.text = "Name"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "WayTableCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        routes = DataLayer.sharedInstance.getRoutes()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as UIViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return routes.count;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! WayTableCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss"
        
        let route:Route? = routes[indexPath.row]
        cell.wayDate.text = dateFormatter.string(from: (route?.date)! as Date)
        cell.wayName.text = route?.name
        
        return cell
    }
}

