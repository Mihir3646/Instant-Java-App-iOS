//
//  HomeViewController.swift
//  Instant Java
//
//  Created by abhishekbihani on 11/07/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit
import Toaster
import Amplitude_iOS

extension String {
    
    /// Percent escapes values to be added to a URL query as specified in RFC 3986
    ///
    /// This percent-escapes all characters besides the alphanumeric character set and "-", ".", "_", and "~".
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// - returns: Returns percent-escaped string.
    
    func addingPercentEncodingForURLQueryValue() -> String? {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: generalDelimitersToEncode + subDelimitersToEncode)
        
        return addingPercentEncoding(withAllowedCharacters: allowed)
    }
    
}

extension Dictionary {
    
    /// Build string representation of HTTP parameter dictionary of keys and objects
    ///
    /// This percent escapes in compliance with RFC 3986
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// - returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
    
    func stringFromHttpParameters() -> String {
        let parameterArray = map { key, value -> String in
            let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
    
}

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    // MARK: - Outlet and variable -
    
    let appDelegate : AppDelegate! = UIApplication.shared.delegate as! AppDelegate
    var hud: MBProgressHUD?
    var intSelectedIndex = 0
    var arrData = NSArray() //aaliya
    var arrTopic = NSArray() // aaliya
    var arrStar = NSArray()
    
    var arrNo:[String] = []
    var arrSubtopicData =  NSArray()
    var arrSubtopicName =  NSArray()
    var arrSubtopicResult =  NSArray()
    var arrDurationResult =  NSArray()
    var arrPageResult = NSArray()
    var strZip = String()
    var contain = Bool()
    
    @IBOutlet var tblview: UITableView!
    @IBOutlet var lblProgresspercentage: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var lblTotlaStar: UILabel!
    @IBOutlet var imgCourse: UIImageView!
    @IBOutlet var lblGames: UILabel!
    @IBOutlet var lblrent: UILabel!
    @IBOutlet var imgGames: UIImageView!
    @IBOutlet var lblCourse: UILabel!
    
    // MARK: - view lifecycle -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tblview.isHidden = true
        
        lblrent.text = String(appDelegate.intRent) + "/" + "29"
        lblTotlaStar.text = String(appDelegate.intTotalStar) + " " + "stars"
        let actualprogress : Float = 100.0 / 29.0
        let progress : Float = 100.0/Float(appDelegate.intRent)
        let progressValue = actualprogress / progress
        
        progressView.setProgress(progressValue, animated: true)
        var progressPercentage = Int(progressValue * 100) as Int
        
        lblProgresspercentage.text = String(progressPercentage) + "%"
        defaults.set(appDelegate.intRent, forKey: "rent")
        //progressView.progress = 100.0-Float(100/appDelegate.intRent)
        
        //        if !appDelegate.isWSCalled
        //        {
        apiCall()
        // }
        
        print(appDelegate.arrStar)
        imgCourse.image = UIImage(named:"course_blue")
        imgGames.image = UIImage(named:"game_black")
        lblCourse.textColor = colour.homeTabBar
        lblGames.textColor = UIColor.black
        
        let userid = HelperClass.getValSharedPrefObj(key: "userid")
        let identify = AMPIdentify().set("userid", value: userid as NSObject!)
        Amplitude.instance().identify(identify)
        
        // tblview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        if let arr : [Int] = UserDefaults.standard.value(forKey: "star") as? [Int]
        {
            appDelegate.arrStar.removeAll()
            appDelegate.arrStar.append(contentsOf: arr)
        }
        else
        {
            appDelegate.arrStar.removeAll()
        }
        
        tblview.reloadData()
    }
    
    // MARK: - tableview datasource  -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if appDelegate.isCommingSoon == true
        {
            return self.arrTopic.count + 1
        }
        else
        {
            return self.arrTopic.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let defaults = UserDefaults.standard
        
        let cell:HomeTableViewCell = self.tblview.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell!
        cell.imgThreestar.image = nil
        
        
        
        if appDelegate.isCommingSoon == true && indexPath.row == arrTopic.count
        {
            cell.seperatorUp.isHidden = false
            cell.seperatorLine.isHidden = true
            cell.seperatorView.layer.frame = CGRect(x: cell.frame.origin.x, y:cell.contentView.frame.height-10, width: tblview.frame.width, height: cell.frame.size.height)
            cell.seperatorView.layer.borderWidth = 1.0
            cell.seperatorView.layer.borderColor = colour.selectedGreen.cgColor
            cell.lblNo.backgroundColor = colour.selectedGreen
            cell.lblNo.textColor = UIColor.white
            cell.seperatorView.backgroundColor = colour.SelectedLightGreen
            cell.lblQuestion.textColor = colour.selectedGreen
            
            cell.lblNo.text = String(self.arrNo.count + 1)
            cell.lblQuestion.text = "Coming soon"
            
            cell.imgOneStar.isHidden = true
            cell.imgTwoStarimg.isHidden = true
            cell.imgThreestar.isHidden = true
        }
        else
        {
            cell.imgOneStar.isHidden = false
            cell.imgTwoStarimg.isHidden = false
            cell.imgThreestar.isHidden = false
            
            if indexPath.row == defaults.object(forKey: "homeselectedIndex") as! Int
            {
                cell.seperatorUp.isHidden = false
                cell.seperatorLine.isHidden = true
                cell.lblNo.backgroundColor = UIColor.white
                cell.lblNo.textColor = colour.selectedGreen
                cell.seperatorView.backgroundColor = colour.selectedGreen
                cell.lblQuestion.textColor = UIColor.white
                
                cell.imgThreestar.image = nil
            }
            else
            {
                cell.layer.borderColor = UIColor.white.cgColor
                cell.lblNo.backgroundColor = UIColor.lightGray
                cell.lblNo.textColor = UIColor.white
                cell.seperatorView.backgroundColor = colour.unselectedsItem
                cell.lblQuestion.textColor = UIColor.lightGray
                cell.imgThreestar.image = UIImage(named:"lock")
                cell.seperatorView.layer.borderWidth = 0.0
                cell.seperatorView.layer.borderColor = UIColor.lightGray.cgColor
                cell.imgOneStar.image = nil
                cell.imgTwoStarimg.image = nil
                cell.seperatorUp.isHidden = true
                cell.seperatorLine.isHidden = true
            }
            
            if((UserDefaults.standard.array(forKey: "SavedStringArray")) != nil)
            {
                var array = defaults.object(forKey: "SavedStringArray") as! [Int]
                if array.count != 0 {
                    var contain = array.contains(indexPath.row)
                    if contain
                    {
                        cell.seperatorUp.isHidden = false
                        cell.seperatorLine.isHidden = false
                        cell.seperatorView.layer.frame = CGRect(x: cell.frame.origin.x, y:cell.contentView.frame.height-10, width: self.tblview.frame.width, height: cell.frame.size.height)
                        cell.seperatorView.layer.borderWidth = 1.0
                        cell.seperatorView.layer.borderColor = colour.selectedGreen.cgColor
                        cell.lblNo.backgroundColor = colour.selectedGreen
                        cell.lblNo.textColor = UIColor.white
                        cell.seperatorView.backgroundColor = colour.SelectedLightGreen
                        cell.lblQuestion.textColor = colour.selectedGreen
                        
                        
                        if appDelegate.arrStar.count != 0 && indexPath.row < appDelegate.arrStar.count
                        {
                            if appDelegate.arrStar[indexPath.row] == 1{
                                cell.imgOneStar.image = UIImage(named:"fill_star")
                                cell.imgTwoStarimg.image = UIImage(named:"unfill_star")
                                cell.imgThreestar.image = UIImage(named:"unfill_star")
                            }
                            if appDelegate.arrStar[indexPath.row] == 2{
                                cell.imgOneStar.image = UIImage(named:"fill_star")
                                cell.imgTwoStarimg.image = UIImage(named:"fill_star")
                                cell.imgThreestar.image = UIImage(named:"unfill_star")
                            }
                            if appDelegate.arrStar[indexPath.row] == 3{
                                cell.imgOneStar.image = UIImage(named:"fill_star")
                                cell.imgTwoStarimg.image = UIImage(named:"fill_star")
                                cell.imgThreestar.image = UIImage(named:"fill_star")
                            }
                        }
                        else
                        {
                            cell.imgThreestar.image = nil
                        }
                    }
                }
                
            }
            else
            {
                cell.seperatorUp.isHidden = true
                cell.seperatorLine.isHidden = true
            }
            
            
            cell.lblNo.text = self.arrNo[indexPath.row]
            cell.lblQuestion.text = self.arrTopic[indexPath.row] as? String
            
            if indexPath.row == self.arrTopic.count-1 && appDelegate.isCommingSoon == false
            {
                cell.seperatorLine.isHidden = true
            }
            else if indexPath.row == self.arrTopic.count-1 && appDelegate.isCommingSoon == true
            {
                cell.seperatorLine.isHidden = false
            }
        }
        
        if indexPath.row == 0
        {
            cell.seperatorUp.isHidden = true
        }
        
        cell.imgThreestar.isHidden = true
        cell.imgTwoStarimg.isHidden = true
        cell.imgOneStar.isHidden = true
        
        return cell
    }
    
    //    func scrollToNearestSelectedRow(at scrollPosition: UITableViewScrollPosition, animated: Bool)
    //    {
    //        tblview.reloadData()
    //    }
    
    // MARK: - Tableview datasource -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 2 //PURCHASE
        {
            appDelegate.isThirdTopic = true
        }
        else
        {
            appDelegate.isThirdTopic = false
        }
        
        //aaliya 7 - false
        if(indexPath.row == 0){
            HelperClass.setValSharedPerf(key: "isFirstIndex", value: "true")
            
        }
        
        //aaliya 7- true
        
        if(indexPath.row == arrTopic.count-1){
            HelperClass.setValSharedPerf(key: "isLastIndex", value: "true")
            
        }
        
        if appDelegate.isCommingSoon == true && indexPath.row == arrTopic.count
        {
            let SubViewInstance = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier:instantiateID.feedback__ViewController) as! feedback__ViewController
            SubViewInstance.modalTransitionStyle = .crossDissolve
            let window: UIWindow! = UIApplication.shared.keyWindow
            let windowImage = window.capture()
            SubViewInstance.img = windowImage
            self.present(SubViewInstance, animated:true, completion:nil)
            return
        }
        
        let indexPath = tblview.indexPathForSelectedRow
        let cell : HomeTableViewCell! = tblview.cellForRow(at: indexPath! ) as! HomeTableViewCell
        
        if((UserDefaults.standard.array(forKey: "SavedStringArray")) != nil)
        {
            var array = defaults.object(forKey: "SavedStringArray") as! [Int]
            if array.count != 0 {
                contain = array.contains(indexPath!.row)
            }
        }
        
        if  indexPath!.row == defaults.object(forKey: "homeselectedIndex") as! Int  || contain
        {
            self.arrSubtopicResult = (self.arrData.value(forKey: "subtopics") as! NSArray)
            print(self.arrSubtopicResult)
            self.arrSubtopicData = self.arrSubtopicResult[indexPath!.row] as! NSArray
            
            self.arrSubtopicName = (self.arrSubtopicData.value(forKey: "subtopic_name") as! NSArray)
            self.arrDurationResult = (self.arrSubtopicData.value(forKey: "duration") as! NSArray)
            let SubTopicViewControllerObj = StorybordId.HomestoryBoard.instantiateViewController(withIdentifier: "SubTopicViewController") as! SubTopicViewController
            appDelegate.arrSubtopicQuestionAppdelegate = self.arrSubtopicName
            appDelegate.arrDurationAppdelegate = self.arrDurationResult
            appDelegate.strTitleAppdelegate = cell.lblQuestion.text!
            appDelegate.arrAllSubTopicAppdelegate = self.arrSubtopicData
            
            for var i in 0..<self.arrSubtopicData.count
            {
                let data = (self.arrSubtopicData.value(forKey: "data") as! NSArray)
                let arrdataIndex = data[i] as! NSArray
                let intPageCount = arrdataIndex.count as Int
                let strPage = String(intPageCount) as String
                self.arrPageResult = self.arrPageResult.adding(strPage) as NSArray
                
            }
            appDelegate.intHome = indexPath!.row
            if appDelegate.IntHomeSelected == appDelegate.intHome
            {
                appDelegate.arrSubtopicSelectedIndex.removeAll()
                appDelegate.ishome = true
                appDelegate.isstar = true
                let defaults = UserDefaults.standard
                defaults.set(appDelegate.IntSubtopicSelected, forKey: "SubtopicselectedIndex")
                
                if((UserDefaults.standard.array(forKey: "SubTopic")) != nil)
                {
                    appDelegate.arrSubtopicSelectedIndex = defaults.object(forKey: "SubTopic") as! [Int]
                    appDelegate.IntSubtopicSelected = defaults.object(forKey: "SubtopicselectedIndex") as! Int
                }
                else
                {
                    appDelegate.IntSubtopicSelected = 0
                    defaults.set(appDelegate.IntSubtopicSelected, forKey: "SubtopicselectedIndex")
                }
                if indexPath!.row == self.arrTopic.count-1
                {
                    appDelegate.isCommingsoonLastIndex = true
                }
            }
            else
            {
                appDelegate.ishome = false
                appDelegate.isstar = false
                
                if((UserDefaults.standard.array(forKey: "SubTopic")) != nil)
                {
                    appDelegate.arrSubtopicSelectedIndex = defaults.object(forKey: "SubTopic") as! [Int]
                    appDelegate.IntSubtopicSelected = defaults.object(forKey: "SubtopicselectedIndex") as! Int
                }
                    
                else
                {
                    appDelegate.IntSubtopicSelected = 0
                    defaults.set(appDelegate.IntSubtopicSelected, forKey: "SubtopicselectedIndex")
                }
            }
            appDelegate.star = 0
            appDelegate.arrPage = self.arrPageResult
            
            self.performSegue(withIdentifier: "segueHomeToSubHome", sender: nil)
            
            //self.present(SubTopicViewControllerObj, animated:true, completion:nil)
        }
    }
    
    //# MARK: - api call class -
    
    func sendRequest(url: String, parameters: [String: AnyObject], completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        let parameterString = parameters.stringFromHttpParameters()
        let requestURL = URL(string: url + "?" + parameterString)!
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
        
        return task
    }

        
    func apiCall()
    {
        if ConnectionCheck.isConnectedToNetwork()
        {
            
            
            hud = MBProgressHUD.showAdded(to: view, animated: true)
            //hud.mode = MBProgressHUDModeAnnularDeterminate
            hud?.label.text = "Loading"
            
            let  Dicparams = ["lang":"java","client":"ios"] //"unitname":"","topicname":""
            
            
            let jsonData = try! JSONSerialization.data(withJSONObject: Dicparams, options: JSONSerialization.WritingOptions.prettyPrinted)
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
            let filterjason = String(jsonString.characters.filter { !"\n".characters.contains($0) })
            let strResult =  filterjason.replacingOccurrences(of: " ", with: "")
            let postString = "data=\(strResult)"
            let strurl = BaseUrl + WSList.home + "?\(postString)" as String
            let escapedString = strurl.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
            
        
//            sendRequest(url: BaseUrl + WSList.home, parameters: Dicparams as [String : AnyObject], completionHandler: { (data, response, error) in
//                
//                print(response)
//                
//                
//                
//            })
//
            
            var uuuuuuu : String = "https://api.programminghub.io/api/phcourse/getcoursecontent?data={%22lang%22:%22Fundamentals%22,%22client%22:%22ios%22}"
            
            uuuuuuu = uuuuuuu.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
            
            ApiCall.sharedInstance.requestGetMethod(apiUrl: escapedString!)
            {(success, responseData) in
                DispatchQueue.main.async
                    {
                        
                        let response = responseData ?? AnyObject.self as! NSArray
                        print(response)
                        UserDefaults.standard.set(response, forKey: "response")
                        
                        self.strZip = response.value(forKey: "imgziplink") as! String
                        self.arrData = response.value(forKey: "data") as! NSArray
                        
                        
                        self.arrTopic = self.arrData.value(forKey: "topic_name") as! NSArray
                        self.arrStar = self.arrData.value(forKey: "isstar") as! NSArray
                        print(self.arrStar)
                        
                        for var i in 1..<self.arrData.count+1
                        {
                            self.arrNo.append(String(i))
                        }
                        self.tblview.delegate = self
                        self.tblview.dataSource = self
                        self.tblview.reloadData()
                        self.hud?.hide(animated: true)
                        self.tblview.isHidden = false
                        self.appDelegate.isWSCalled = true
                    }
            }
            
//            let headers = [
//                "cache-control": "no-cache"
//                //                "postman-token": "38deef91-29e5-f0e2-f0a9-5918c7920a7a"
//            ]
//            let request = NSMutableURLRequest(url: NSURL(string: "https://api.programminghub.io/api/phcourse/getcoursecontent?%0Adata=%7B%0A%20%20%20%20%22lang%22%3A%22Fundamentals%22%2C%0A%20%20%20%20%22client%22%3A%22ios%22%0A%7D")! as URL,
//                                              cachePolicy: .useProtocolCachePolicy,
//                                              timeoutInterval: 10.0)
//            request.httpMethod = "GET"
//            request.allHTTPHeaderFields = headers
//            
//            let session = URLSession.shared
//            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//                if (error != nil) {
//                    print(error)
//                }
//                else
//                {
//                    let httpResponse = response as? HTTPURLResponse
//                    print(httpResponse)
//                    
//                    // self.call(data: data!)
//                    
//                    print(httpResponse?.statusCode)
//                    
//                    do {
//                        //                        let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
//                        //                        // here "jsonData" is the dictionary encoded in JSON data
//                        
//                        let decoded = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
//                        print(decoded)
//                        // here "decoded" is of type `Any`, decoded from JSON data
//                        
//                        // you can now cast it with the right type
//                        
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                    
//                }
//            })
//            
//            dataTask.resume()
            
        }
        else
        {
            DispatchQueue.main.async
                {
                    self.hud?.hide(animated: true)
                    
                    let toast = Toast(text: "No internet connection")
                    toast.show()
            }
        }
    }
    
    //    func call( data : Data)
    //    {
    //        if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    //        {
    //            // Print out dictionary
    //            print(convertedJsonIntoDict)
    //            //completion(true, convertedJsonIntoDict as AnyObject?)
    //        }
    //    }
    
    // MARK: - Memory management -
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
