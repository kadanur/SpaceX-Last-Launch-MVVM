//
//  HomeViewController.swift
//  AppNationCase
//
//  Created by M Kaan Adanur on 26.01.2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    var vm = SpaceViewModel()
    var wikipediaURL = URL(string: "")
    var youtubeURL = URL(string: "")
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var wikipediaButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var flightLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        youtubeButton.isEnabled = false
        wikipediaButton.isEnabled = false
        fetchData()

    }
    
    func fetchData(){
        let url = URL(string: "https://api.spacexdata.com/v4/launches/latest")
        Webservice().getData(url: url!) { result in
            DispatchQueue.main.async {
                if let result = result {
                    print(result)
                    self.nameLabel.text = "Ship name: " + self.vm.name
                    self.flightLabel.text = "Flight number: " + self.vm.flighNumber
                    self.detailsLabel.text = "Detail: " + self.vm.detail
                    self.dateLabel.text = "Date: " + self.vm.date
                    if self.vm.webcast == nil{
                        self.youtubeButton.isEnabled = false
                    }else{
                        self.youtubeButton.isEnabled = true
                        self.youtubeURL = URL(string: self.vm.webcast!)
                        }
                    if self.vm.wikipedia == nil{
                        self.wikipediaButton.isEnabled = false
                    }else{
                        self.wikipediaButton.isEnabled = true
                        self.wikipediaURL = URL(string: self.vm.wikipedia!)
                        }
                    
                }else{
                    let alert = UIAlertController(title: "Data Error", message: ("Data download error. Please check your internet connection."), preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated:true, completion: nil)
                }
                }
            
            DispatchQueue.global().async {
                
                do{
                    self.data = try Data(contentsOf: URL(string: "https://i.imgur.com/573IfGk.png")!)
                    DispatchQueue.main.async {
                        self.image.image = UIImage(data: self.data)
                        }
                }catch{
                    print(error.localizedDescription)
                    print("-----IMAGE ERROR------")
                  
                    
                    let alert = UIAlertController(title: "Image Error", message: ("\(error.localizedDescription). Please check your internet connection."), preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated:true, completion: nil)
                }
                
               
                }
            
            }
        }
    
    
    
    
    @IBAction func wikipediaButtonClicked(_ sender: Any) {
        UIApplication.shared.open(wikipediaURL!)
    }
    
    @IBAction func youtubeButtonClicked(_ sender: Any) {
        
        UIApplication.shared.open(youtubeURL!)
        
    }
    
        
        
    }
    

