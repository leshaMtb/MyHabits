//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Apple on 14.05.2021.
//

import UIKit
//первый звонок
protocol ProtocolForCallFromCorrectToDetail {
    func callFromCorrectToDetail()
}




class HabitDetailsViewController: UIViewController {

    
    
    var callFromDetailToHabits: TestDelegate?
    
    private lazy var habitDetailTableView: UITableView = {
        let habitDetailTableView = UITableView(frame: .zero, style: .grouped)
        habitDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        habitDetailTableView.register(HabitDetailHeader.self, forHeaderFooterViewReuseIdentifier: String(describing: HabitDetailHeader.self))
        habitDetailTableView.register(HabitDetailViewCell.self, forCellReuseIdentifier: String(describing: HabitDetailViewCell.self))
        habitDetailTableView.delegate = self
        habitDetailTableView.dataSource = self
        return habitDetailTableView
    }()
  
    
    private lazy var correctHabitVC = CorrectHabitViewController(habit: habit)
    
   
    let habit: Habit
       
       init(habit: Habit) {
           self.habit = habit
           super.init(nibName: nil, bundle: nil)
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //!!!!!!!!!!!!!!!!!!!!!
        correctHabitVC.delegateCorrectVC = self
        
        
        view.backgroundColor = .systemGray6
        habitDetailTableView.backgroundColor = .systemGray6
        title = habit.name
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(correctHabit))
        
        view.addSubview(habitDetailTableView)
        NSLayoutConstraint.activate([
            habitDetailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitDetailTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitDetailTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitDetailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    @objc func correctHabit() {
          navigationController?.present(correctHabitVC, animated: true, completion: nil)
      }

}


extension HabitDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 40
      }
    
}


extension HabitDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return HabitsStore.shared.dates.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HabitDetailViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HabitDetailViewCell.self)) as! HabitDetailViewCell
       
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: HabitsStore.shared.dates.count - 1 - indexPath.item)
        
        if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates[HabitsStore.shared.dates.count - 1 - indexPath.item]) == true {
            cell.checkMark.isHidden = false
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HabitDetailHeader()
    }
    
    
}

extension HabitDetailsViewController: ProtocolForCallFromCorrectToDetail {
    
    func callFromCorrectToDetail() {
        //нажатие кнопки сохранить в корректе теперь звонит сюда
        print("Позвонили из корректа в детэйл, дальше звоним в хэбитс")
        self.callFromDetailToHabits?.updCollection()
        
        
        
    }
    
    
}
