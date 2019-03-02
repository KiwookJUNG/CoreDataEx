//
//  LogVC.swift
//  CoreDataEx
//
//  Created by 정기욱 on 02/03/2019.
//  Copyright © 2019 Kiwook. All rights reserved.
//

import UIKit
import CoreData

class LogVC: UITableViewController {
    var board: BoardMO! // 이 변수는 목록화면에서 전달하는 게시글 객체를 저장하기 위해 사용
    
    // 멤버 변수 list를 정의하고 원 게시글이 참조하는 로그 데이터 목록을 LogMO타입으로 가져와 대입하도록 처리
    lazy var list: [LogMO]! = {
        return self.board.logs?.array as! [LogMO]
    }()
    
    override func viewDidLoad() {
        self.navigationItem.title = self.board.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "logcell")!
        cell.textLabel?.text = "\(row.regdate!)에 \(row.type.toLogType()) 되었습니다"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        
        return cell
    }
    
}

public enum LogType: Int16 {
    case create = 0
    case edit = 1
    case delete = 2
}

extension Int16 {
    func toLogType() -> String {
        switch self {
        case 0 : return "생성"
        case 1 : return "수정"
        case 2 : return "삭제"
        default : return ""
        }
    }
}
