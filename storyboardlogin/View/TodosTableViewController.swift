//
//  TodosTableViewController.swift
//  storyboardlogin
//
//  Created by 최범규 on 12/19/23.
//

import UIKit

class TodosTableViewController: UITableViewController {
    // MARK: - Properties
    // MARK: Privates
    /// todo 목록
    private var todos: [Todo] = Todo.all
    
    /// 셀에 표시할 날짜를 포멧하기 위한 Date Formatter
    private let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.short
        return formatter
    }()
    
    // MARK: - Methods
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIViewController에서 제공하는 기본 수정버튼
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 화면이 보여질 때마다 todo 목록을 새로고침
        self.todos = Todo.all
        self.tableView.reloadSections(IndexSet(integer: 0), with: UITableView.RowAnimation.automatic)
    }
    
    /// 코드블록 8-3-3
    // MARK: Table view data source
    /// 테이블뷰의 섹션 수 (기본값 1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// 테이블뷰의 섹션 별 로우 수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }
    
    // dequeue : 뷰의 재사용 개념
    /// 인덱스에 해당하는 cell 반환
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 스토리보드에 구현해 둔 셀을 재사용 큐에서 꺼내옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        guard indexPath.row < self.todos.count else { return cell }
        
        let todo: Todo = self.todos[indexPath.row]
        
        // 셀에 내용 설정
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = self.dateFormatter.string(from: todo.due)
        
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let todoViewController: TodoViewController = segue.destination as? TodoViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else { return }
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else { return }
        
        guard index.row < todos.count else { return }
        let todo: Todo = todos[index.row]
        todoViewController.todo = todo
    }
}
