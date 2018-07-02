//
//  GRInfoLocationViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 25/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit

class GRInfoLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var locationImageArray: [String] = []
    var textArray: [String] = []

    
    //MARK: - Outlets
    @IBOutlet weak var infoLocationTableView: UITableView!
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLocationTableView.delegate = self
        infoLocationTableView.dataSource = self
        
        
        locationImageArray = ["1", "2", "3"]
        
        
        textArray.append("Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
        
        textArray.append("Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
        
        textArray.append("Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
        
       
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let backButtonImage = UIImage(named: "backSignWh")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(goBack))
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.topItem?.title = "Location info"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        
        
        navigationItem.title = "Location info"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //MARK: - Actions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationImageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell : InfoLocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "InfoLocationTableViewCell", for: indexPath) as! InfoLocationTableViewCell
        
        
        
        cell.locationImage.image = UIImage(named: locationImageArray[indexPath.row])
        cell.locationText.text = textArray[indexPath.row]
        cell.locationText.textColor = UIColor.white
        
        
        
        let exclusionPath:UIBezierPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: cell.locationImage.frame.size.width, height: cell.locationImage.frame.size.height))

        cell.locationText.textContainer.exclusionPaths  = [exclusionPath]
        cell.locationText.addSubview(cell.locationImage)

        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
}
