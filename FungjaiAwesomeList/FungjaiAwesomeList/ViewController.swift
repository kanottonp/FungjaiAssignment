//
//  ViewController.swift
//  FungjaiAwesomeList
//
//  Created by Athipat Nampetch on 3/20/18.
//  Copyright © 2018 kanottonp. All rights reserved.
//

import UIKit

struct Cover: Decodable {
    let name: String
    let type : String
    let cover: String
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var covers = [Cover]()
    @IBOutlet weak var tableView: UITableView!
   
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    
        let url = URL(string:"https://www.anop72.info/api/seed.json" )
        URLSession.shared.dataTask(with: url!) { (data, res, error) in
            if error == nil {
                do {
                    self.covers = try JSONDecoder().decode([Cover].self, from: data!)
                } catch {
                    print(error)
                }
                
                DispatchQueue.main.async {
                      self.tableView.reloadData()
                }
            }
        }.resume()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if covers[indexPath.row].type == "video" {
            return 225
        }
        else {
            return 125
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return covers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

    let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! FungjaiTableViewCell
    
    if covers[indexPath.row].type == "track" {
        
        cell.namelabel.text = covers[indexPath.row].name.capitalized
        cell.namelabel.lineBreakMode = .byWordWrapping
        cell.namelabel.numberOfLines = 0
        
        cell.coverImage.downloadedFrom(link: covers[indexPath.row].cover)
        cell.coverImage.contentMode = .scaleAspectFill

    
    return cell
        
    }
        
    else if (covers[indexPath.row].type == "video" || covers[indexPath.row].type == "ads") {
        cell.videoLabel.text = covers[indexPath.row].name.capitalized
        cell.videoLabel.lineBreakMode = .byWordWrapping
        cell.videoLabel.numberOfLines = 0
        
        cell.videoImage.downloadedFrom(link: covers[indexPath.row].cover)
        cell.videoImage.contentMode = .scaleAspectFill

    return cell
        
    }
        
    return cell
    }
    

}
