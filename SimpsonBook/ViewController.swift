//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Tayyip Çakmak on 18.10.2020.
//  Copyright © 2020 Tayyip Cakmak. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var mySimpsons = [Simpsons]()
    var chosenSimpson : Simpsons?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.dataSource = self
      tableView.delegate = self
        
        let homer = Simpsons(nameInit: "Homer Simpson", jobInit: "Chemist", imageInit: UIImage(named: "homer")!)
        let bart = Simpsons(nameInit: "Bart Simpson", jobInit: "Student", imageInit: UIImage(named: "bart")!)
        let lisa = Simpsons(nameInit: "Lisa Simpson", jobInit: "Student", imageInit: UIImage(named: "lisa")!)
        let maggie = Simpsons(nameInit: "Maggie Simpson", jobInit: "Baby", imageInit: UIImage(named: "maggie")!)
        let marge = Simpsons(nameInit: "Marge Simpson", jobInit: "Housewife", imageInit: UIImage(named: "marge")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        mySimpsons.append(marge)
        
        navigationItem.title = "Simpsons"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}

