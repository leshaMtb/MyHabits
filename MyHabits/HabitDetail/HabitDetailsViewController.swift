//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Apple on 14.05.2021.
//

import UIKit



class HabitDetailsViewController: UIViewController {

    weak var callFromDetailToHabits: TestDelegate?

    let store: HabitsStore = .shared

    var myTitle = ""


    private lazy var habitDetailTableView: UITableView = {
        let habitDetailTableView = UITableView(frame: .zero, style: .grouped)
        habitDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        habitDetailTableView.register(HabitDetailHeader.self, forHeaderFooterViewReuseIdentifier: String(describing: HabitDetailHeader.self))
        habitDetailTableView.register(HabitDetailViewCell.self, forCellReuseIdentifier: String(describing: HabitDetailViewCell.self))
        habitDetailTableView.delegate = self
        habitDetailTableView.dataSource = self
        return habitDetailTableView
    }()

    private lazy var correctHabitVC = CorrectHabitViewController(habit: habit, openForCreateNewHabit: false)

    var habit: Habit
    init(habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = habit.name
        habitDetailTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            // print("\(myTitle) это мой тайтл")
        
        navigationItem.largeTitleDisplayMode = .never
        
        correctHabitVC.delegateCorrectVC = self
       
        view.backgroundColor = .systemGray6
        habitDetailTableView.backgroundColor = .systemGray6
        title = myTitle
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(correctHabit))
        navigationItem.rightBarButtonItem?.tintColor = .purple

        //как покрасить эту кнопку в фиолетовый?)
        navigationItem.leftBarButtonItem?.tintColor = .purple
        
        view.addSubview(habitDetailTableView)
        NSLayoutConstraint.activate([
            habitDetailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitDetailTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitDetailTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitDetailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

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
        return store.dates.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HabitDetailViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HabitDetailViewCell.self)) as! HabitDetailViewCell

        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: HabitsStore.shared.dates.count - 1 - indexPath.item)

        if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates[HabitsStore.shared.dates.count - 1 - indexPath.item]) == true {
            cell.checkMark.isHidden = false
        } else {
            cell.checkMark.isHidden = true
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HabitDetailHeader()
    }
}

extension HabitDetailsViewController: ProtocolForCallFromCorrectToDetail {
    
    func callFromCorrectToDetail() {

        print("эта функция выполняется по нажатию на кнопку сохранить")
        //не работающее что-то
        title = "laalalalala"

        dismiss(animated: true) {
            self.navigationController?.popToRootViewController(animated: true)
        }
        self.callFromDetailToHabits?.updCollection()
    }


}
