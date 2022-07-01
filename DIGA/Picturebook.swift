//
//  Picturebook.swift
//  DIGA
//
//  Created by Rintaro Kimura on 2022/06/30.
//

import UIKit
import MapKit
import CoreLocation

class Picturebook:UIViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      // セルの左端に画像を追加
      cell.imageView!.image = UIImage(named: "exeid")
            
      return cell
    }
    
}
