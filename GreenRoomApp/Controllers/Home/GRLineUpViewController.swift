//
//  LineUpViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 14/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


class GRLineUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
    
    var artists = [Artist]()
    var filteredArtists = [Artist]()
    
    var isSearching : Bool = false
    
    var myGreenColor = UIColor(hex: 0x1DA84D)
    
    
    //MARK: - Outlets
    @IBOutlet weak var lineUpTableView: UITableView!
    @IBOutlet weak var lineUpsearchBar: UISearchBar!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setArtist()
        
        lineUpTableView.delegate = self
        lineUpTableView.dataSource = self
        
        lineUpsearchBar.delegate = self
        lineUpsearchBar.returnKeyType = UIReturnKeyType.search
        

        filteredArtists = artists
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let backButtonImage = UIImage(named: "backSignWh")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.topItem?.title = "gr"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        
        
        lineUpTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        DispatchQueue.main.async {
//            self.lineUpsearchBar.becomeFirstResponder()
//        }
        
        
        navigationController?.navigationBar.topItem?.title = "Line up"
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
    
    
    //MARK: - Actiions
    private func setArtist() {
        artists.append(Artist(name: "A", place: "CRO", stage: "stageOne", image: "a", time: "22:00 pm - 00:00 pm", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "B", place: "CRO", stage: "stageOne", image: "b", time: "00:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "C", place: "CRO", stage: "stageOne", image: "c", time: "02:00 am - 04:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "D", place: "CRO", stage: "stageOne", image: "d", time: "22:00 pm - 00:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "E", place: "CRO", stage: "stageOne", image: "e", time: "00:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "F", place: "CRO", stage: "stageOne", image: "f", time: "02:00 am - 04:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "", insta: "", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "G", place: "CRO", stage: "stageTwo", image: "g", time: "22:00 pm -23:00 pm", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https:https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "H", place: "CRO", stage: "stageTwo", image: "h", time: "23:00 pm - 00:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "I", place: "CRO", stage: "stageTwo", image: "i", time: "00:00 am - 01:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: ""))
        
        artists.append(Artist(name: "J", place: "CRO", stage: "stageTwo", image: "j", time: "01:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "", internetPage: ""))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return filteredArtists.count
        }
        return artists.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : LineUpTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LineUpTableViewCell", for: indexPath) as! LineUpTableViewCell
        

        if isSearching{
            cell.nameLabel.text = filteredArtists[indexPath.row].name
            
            cell.artistImageView.image = UIImage(named: filteredArtists[indexPath.row].image)
            cell.placeLabel.text = filteredArtists[indexPath.row].place
        }
        else{
            cell.nameLabel.text = artists[indexPath.row].name
            cell.artistImageView.image = UIImage(named: artists[indexPath.row].image)
            cell.placeLabel.text = artists[indexPath.row].place
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "GRDetailArtistViewController") as! GRDetailArtistViewController
        
        if isSearching == true {
            detailVC.getName = filteredArtists[indexPath.row].name
            detailVC.getPicture = UIImage(named: filteredArtists[indexPath.row].image)
            detailVC.getPlace = filteredArtists[indexPath.row].place
            detailVC.getFb = filteredArtists[indexPath.row].fb
            detailVC.getInsta = filteredArtists[indexPath.row].insta
            detailVC.getIntPage = filteredArtists[indexPath.row].internetPage
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        else {
            detailVC.getName = artists[indexPath.row].name
            detailVC.getPicture = UIImage(named: artists[indexPath.row].image)
            detailVC.getPlace = artists[indexPath.row].place
            detailVC.getFb = artists[indexPath.row].fb
            detailVC.getInsta = artists[indexPath.row].insta
            detailVC.getIntPage = artists[indexPath.row].internetPage
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if lineUpsearchBar.text == nil || lineUpsearchBar.text == ""{
            isSearching = false
            lineUpTableView.reloadData()
            view.endEditing(true)
        }
        else{
            isSearching = true
            filteredArtists = artists.filter({ (artists) -> Bool in
                artists.name.lowercased().contains(searchText.lowercased())
            })
            lineUpTableView.reloadData()
        }
    }
    
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
   
}
