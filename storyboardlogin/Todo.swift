//
//  Todo.swift
//  storyboardlogin
//
//  Created by 최범규 on 12/19/23.
//

import Foundation

/// Todo 인스턴스를 표현할 구조체
struct Todo: Codable {
    var title: String       // 작업이름
    var due: Date           // 작업기한
    var memo: String?       // 작업메모
    var shouldNotify: Bool  // 사용자가 기한에 맞춰 알림을 받기 원하는지
    var id: String          // 작업 고유 ID
}

/// extension -> 기능별 관리에 용이함
/// Todo 목록 저장/로드
extension Todo {
    
    static var all: [Todo] = Todo.loadTodosFromJSONFile()
    
    /// Todo JSON 파일 위치
    private static var todosPathURL: URL {
        return try! FileManager.default.url(for: FileManager.SearchPathDirectory.applicationSupportDirectory,
                                            in: FileManager.SearchPathDomainMask.userDomainMask,
                                            appropriateFor: nil,
                                            create: true).appendingPathComponent("todos.json")
    }
    
    /// JSON 파일로부터 Todo 배열 읽어오기
    private static func loadTodosFromJSONFile() -> [Todo] {
        do {
            let jsonData: Data = try Data(contentsOf: self.todosPathURL)
            let todos: [Todo] = try JSONDecoder().decode([Todo].self, from: jsonData)
            return todos
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    /// 현재 Todo 배열 상태를 JSON 파일로 저장
    @discardableResult private static func saveToJSONFile() -> Bool {
        do {
            let data: Data = try JSONEncoder().encode(self.all)
            try data.write(to: self.todosPathURL, options: Data.WritingOptions.atomicWrite)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}


/// 현재 Todo 배열에 추가/삭제/수정
extension Todo {
    
    @discardableResult static func remove(id: String) -> Bool {
        
        guard let index: Int = self.all.index(where: { (todo: Todo) -> Bool in
            todo.id == id
        }) else { return false }
        self.all.remove(at: index)
        return self.saveToJSONFile()
    }
    
    @discardableResult func save(completion: () -> Void) -> Bool {
        
        if let index = Todo.index(of: self) {
            Todo.all.replaceSubrange(index...index, with: [self])
        } else {
            Todo.all.append(self)
        }
        
        let isSuccess: Bool = Todo.saveToJSONFile()
        
        if isSuccess {
            completion()
        }
        
        return isSuccess
    }
    
    private static func index(of target: Todo) -> Int? {
        guard let index: Int = self.all.index(where: { (todo: Todo) -> Bool in
            todo.id == target.id
        }) else { return nil }
        
        return index
    }
}
