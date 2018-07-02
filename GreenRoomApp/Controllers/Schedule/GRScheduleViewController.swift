//
//  SecondViewController.swift
//  GrApp
//
//  Created by Saša Brezovac on 13/06/2018.
//  Copyright © 2018 CopyPaste89. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


class GRScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    var artists = [Artist]()
    var filteredArtists = [Artist]()
    
    var artistTwo = [Artist]()
    var filteredArtistTwo = [Artist]()
    
    var isSearching : Bool = false
    var dayOnePressed: Bool = true
    
    var name: String!
    var picture: UIImage!
    
   var myGreenColor = UIColor(hex: 0x1DA84D)
    
    //MARK: - Outlets
    @IBOutlet weak var scheduleTableVew: UITableView!
    @IBOutlet weak var scheduleSearchBar: UISearchBar!
    
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var underLineView: UIView!
    @IBOutlet weak var underLineWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var dayMenuStackView: UIStackView!
    
    @IBOutlet weak var dayOneButton: UIButton!
    @IBOutlet weak var dayTwoButton: UIButton!
    
    
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDayOneArtist()
        setDayTwoArtist()

        scheduleTableVew.delegate = self
        scheduleTableVew.dataSource = self
        
        scheduleSearchBar.delegate = self
        scheduleSearchBar.returnKeyType = UIReturnKeyType.search
        
        underLineWidthConstraint.constant = UIScreen.main.bounds.width / 2
        
        dayOneButton.layer.borderWidth = 0.5
        dayOneButton.layer.borderColor = UIColor.black.cgColor
        dayOneButton.setTitleColor(myGreenColor, for: .normal)
        
        dayTwoButton.layer.borderWidth = 0.5
        dayTwoButton.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.topItem?.title = "Schedule"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if UIScreen.main.bounds.size.height == 812 {
            let image = UIImage(named: "navImage")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        else {
            let image = UIImage(named: "nBarImage2")
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }
        
        scheduleTableVew.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

    
    //MARK: - Actions
    private func setDayOneArtist() {
        artists.append(Artist(name: "A", place: "CRO", stage: "stageOne", image: "a", time: "22:00 pm - 00:00 pm", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "B", place: "CRO", stage: "stageOne", image: "b", time: "00:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artists.append(Artist(name: "C", place: "CRO", stage: "stageOne", image: "c", time: "02:00 am - 04:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
    }
    
    
    private func setDayTwoArtist() {
        artistTwo.append(Artist(name: "D", place: "CRO", stage: "stageOne", image: "d", time: "22:00 pm - 00:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artistTwo.append(Artist(name: "E", place: "CRO", stage: "stageOne", image: "e", time: "00:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artistTwo.append(Artist(name: "F", place: "CRO", stage: "stageOne", image: "f", time: "02:00 am - 04:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: true, fb: "", insta: "", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artistTwo.append(Artist(name: "G", place: "CRO", stage: "stageTwo", image: "g", time: "22:00 pm -23:00 pm", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https:https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artistTwo.append(Artist(name: "H", place: "CRO", stage: "stageTwo", image: "h", time: "23:00 pm - 00:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: "https://www.google.com/?client=safari&channel=mac_bm"))
        
        artistTwo.append(Artist(name: "I", place: "CRO", stage: "stageTwo", image: "i", time: "00:00 am - 01:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "https://www.google.com/?client=safari&channel=mac_bm", internetPage: ""))
        
        artistTwo.append(Artist(name: "J", place: "CRO", stage: "stageTwo", image: "j", time: "01:00 am - 02:00 am", text: "Lorepsum dolor sit er  cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", dayOne: false, fb: "https://www.google.com/?client=safari&channel=mac_bm", insta: "", internetPage: ""))
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dayOnePressed == true {
            if isSearching{
                return filteredArtists.count
            }
            return artists.count
        }
        else{
            if isSearching{
                return filteredArtistTwo.count
            }
            return artistTwo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ScheduleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ScheduleTableViewCell", for: indexPath) as! ScheduleTableViewCell
        
        
        if dayOnePressed == true {
            if isSearching{
                cell.nameLabel.text = filteredArtists[indexPath.row].name
                cell.artistImageView.image = UIImage(named: filteredArtists[indexPath.row].image)
                cell.timeLabel.text = filteredArtists[indexPath.row].time
                cell.stageLabel.text = filteredArtists[indexPath.row].stage
            }else{
                cell.nameLabel.text = artists[indexPath.row].name
                cell.artistImageView.image = UIImage(named: artists[indexPath.row].image)
                cell.timeLabel.text = artists[indexPath.row].time
                cell.stageLabel.text = artists[indexPath.row].stage
            }
        }
        else{
            if isSearching{
                cell.nameLabel.text = filteredArtistTwo[indexPath.row].name
                cell.artistImageView.image = UIImage(named: filteredArtistTwo[indexPath.row].image)
                cell.timeLabel.text = filteredArtistTwo[indexPath.row].time
                cell.stageLabel.text = filteredArtistTwo[indexPath.row].stage
            }else{
                cell.nameLabel.text = artistTwo[indexPath.row].name
                cell.artistImageView.image = UIImage(named: artistTwo[indexPath.row].image)
                cell.timeLabel.text = artistTwo[indexPath.row].time
                cell.stageLabel.text = artistTwo[indexPath.row].stage
            }
        }
        
        
        
        if UIScreen.main.bounds.size.height == 568 {
            cell.timeLabelLeadingConstraint.constant = 100
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "GRDetailArtistViewController") as! GRDetailArtistViewController
        
        if dayOnePressed == true {
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
        else{
            if isSearching == true {
                detailVC.getName = filteredArtistTwo[indexPath.row].name
                detailVC.getPicture = UIImage(named: filteredArtistTwo[indexPath.row].image)
                detailVC.getPlace = filteredArtistTwo[indexPath.row].place
                detailVC.getFb = filteredArtistTwo[indexPath.row].fb
                detailVC.getInsta = filteredArtistTwo[indexPath.row].insta
                detailVC.getIntPage = filteredArtistTwo[indexPath.row].internetPage
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
            else {
                detailVC.getName = artistTwo[indexPath.row].name
                detailVC.getPicture = UIImage(named: artistTwo[indexPath.row].image)
                detailVC.getPlace = artistTwo[indexPath.row].place
                detailVC.getFb = artistTwo[indexPath.row].fb
                detailVC.getInsta = artistTwo[indexPath.row].insta
                detailVC.getIntPage = artistTwo[indexPath.row].internetPage
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if dayOnePressed == true {
            if scheduleSearchBar.text == nil || scheduleSearchBar.text == ""{
                isSearching = false
                scheduleSearchBar.setImage(nil, for: .search, state: .normal)
                scheduleTableVew.reloadData()
                view.endEditing(true)
            }
            else{
                isSearching = true
                scheduleSearchBar.setImage(UIImage(named: "backSign"), for: .search, state: .normal)
                filteredArtists = artists.filter({ (artists) -> Bool in
                    artists.name.lowercased().contains(searchText.lowercased())
                })
                scheduleTableVew.reloadData()
            }
        }
        else {
            if scheduleSearchBar.text == nil || scheduleSearchBar.text == ""{
                isSearching = false
                scheduleSearchBar.setImage(nil, for: .search, state: .normal)
                scheduleTableVew.reloadData()
                view.endEditing(true)
            }
            else{
                isSearching = true
                scheduleSearchBar.setImage(UIImage(named: "backSign"), for: .search, state: .normal)
                filteredArtistTwo = artistTwo.filter({ (artists) -> Bool in
                    artists.name.lowercased().contains(searchText.lowercased())
                })
                scheduleTableVew.reloadData()
            }
        }
    }
    

    
    @IBAction func dayOneButtonPressed(_ sender: Any) {
        dayOnePressed = true
        self.scheduleSearchBar.endEditing(true)
        if dayOneButton.titleColor(for: .normal) == myGreenColor{
            
            self.scheduleTableVew.reloadData()
        }
        else {
            dayTwoButton.setTitleColor(UIColor.black, for: .normal)
            dayOneButton.setTitleColor(myGreenColor, for: .normal)
            animateDayOneUnderLine()
            scheduleTableVew.reloadData()
        }
    }
    
    @IBAction func dayTwoButtonPressed(_ sender: Any) {
        dayOnePressed = false
        self.scheduleSearchBar.endEditing(true)
        if dayTwoButton.titleColor(for: .normal) == myGreenColor {
            
            scheduleTableVew.reloadData()
        }
        else{
            
            dayTwoButton.setTitleColor(myGreenColor, for: .normal)
            dayOneButton.setTitleColor(UIColor.black, for: .normal)
            animateDayTwoUnderLine()
            scheduleTableVew.reloadData()
        }
    }
    
    
    
    func animateDayTwoUnderLine(){
        UIView.animate(withDuration: 0.3, animations: {
            self.underLineView.frame = CGRect(x: 0, y: self.menuView.frame.size.height - self.underLineView.frame.height, width: self.underLineView.frame.size.width, height: self.underLineView.frame.height)
        }) { (finished) in
            UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear,animations: {
                
                self.underLineView.frame = CGRect(x: self.underLineView.frame.size.width, y: self.menuView.frame.size.height - self.underLineView.frame.height, width: self.underLineView.frame.size.width, height: self.underLineView.frame.height)
            },completion: nil)
        }
    }
    
    func animateDayOneUnderLine(){
        UIView.animate(withDuration: 0.3, animations: {
            self.underLineView.frame = CGRect(x: self.underLineView.frame.size.width, y: self.menuView.frame.size.height - self.underLineView.frame.height, width: self.underLineView.frame.size.width, height: self.underLineView.frame.height)
        }) { (finished) in
            UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear,animations: {
                self.underLineView.frame = CGRect(x: 0, y: self.menuView.frame.size.height - self.underLineView.frame.height, width: self.underLineView.frame.size.width, height: self.underLineView.frame.height)
            },completion: nil)
        }
    }
}


