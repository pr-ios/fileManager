//
//  ViewController.swift
//  fileManager
//
//  Created by Abdullah AlRashoudi on 11/23/21.
//

import UIKit

class ViewController: UIViewController {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableFolder.dequeueReusableCell(withIdentifier: "celly") as! FolderNameCell
////        cell.labelFolder.text = arrayfolder[indexPath.row]
//        return cell
//    }
//
    @IBOutlet weak var tableFolder: UITableView!
    
    let fileManager = FileManager.default
    let arrayfolder: [String] = []
    @IBOutlet weak var folderName: UITextField!
    @IBOutlet weak var fileContent: UITextField!
    @IBOutlet weak var fileName: UITextField!
    @IBOutlet weak var folderOrFile: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func creatFolder() {
        folderName.text!
        let fileManager = FileManager.default
        let directoryUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let directory = directoryUrl?.appendingPathComponent(folderName.text!)
        do {
            try fileManager.createDirectory(at: directory!, withIntermediateDirectories: true, attributes: [:])
            
        } catch {
            print("Someting wrong")
            
        }
        print(directoryUrl!.path)
    }
    
    func createFile(){
        fileName.text!
        let fileManager = FileManager.default
        let directoryUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let directory = directoryUrl?.appendingPathComponent(folderName.text!)
        let creatMyFile = directoryUrl?.appendingPathComponent(folderName.text!).appendingPathComponent(fileName.text! + ".txt")
        let text = fileContent.text!.data(using: .utf8)
        fileManager.createFile(atPath: creatMyFile!.path, contents: text, attributes: nil)
        
        print(directoryUrl!.path)
    }
    
    @IBAction func chooseFolderOrFile(_ sender: Any) {
        
    
        
        if folderOrFile.selectedSegmentIndex == 1 {
            createFile()

        } else if folderOrFile.selectedSegmentIndex == 0 {

            creatFolder()
        }
        
        
    }
    
}

