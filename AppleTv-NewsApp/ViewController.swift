//
//  ViewController.swift
//  AppleTv-NewsApp
//
//  Created by Abhilash k George on 06/12/22.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var apiKey = "1a6e0805-4635-4eb7-861a-a727235b78bf"
    var articles = [JSON]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let title = title else {return}
        guard let url = URL(string: "https://content.guardianapis.com/\(title.lowercased())?api-key=\(apiKey)&show-feilds=thumbnail,headline,standfirst,body") else {return}
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.fetch(url)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? NewsCell else { fatalError("Couldn't deque a cell!")}
        let newsItem = articles[indexPath.row]
        let title = newsItem["fields"]["headline"].stringValue
        let thumbnail = newsItem["fields"]["thumbnail"].stringValue
        
        newCell.textLabel.text  = title
        
        return newCell
    }
    
    func fetch(_ url: URL) {
        if let data = try? Data(contentsOf: url) {
            articles = JSON(data)["response"]["results"].arrayValue
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } else {
            debugPrint("There has been an error! Try solving it on your own as I don't know what is to be done with if no response is recieved!!")
        }
    }

}

