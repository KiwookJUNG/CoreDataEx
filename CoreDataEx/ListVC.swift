//
//  ListVC.swift
//  CoreDataEx
//
//  Created by 정기욱 on 28/02/2019.
//  Copyright © 2019 Kiwook. All rights reserved.
//

import UIKit
import CoreData

class ListVC: UITableViewController {
    
    
    // 데이터 소스 역할을 할 배열 변수
    // 5. fetch 함수로 데이터를 가져온다.
    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()
    
    // 데이터를 읽어올 메소드
    func fetch() -> [NSManagedObject] {
        
        // 1. 앱 델리게이트 객체 참조.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // 2. 관리 객체 컨텍스트 참조
        let context = appDelegate.persistentContainer.viewContext
        // 3. 요청 객체 생성
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Board")
        // 4. 데이터 가져오기
        let result = try! context.fetch(fetchRequest)
        
        return result
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 해당하는 데이터 가져오기
        let record = self.list[indexPath.row]
        let title = record.value(forKey: "title") as? String
        let contents = record.value(forKey: "contents") as? String
        
        // 셀을 생성하고, 값을 대입한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = contents
        
        return cell
    }
    
}
