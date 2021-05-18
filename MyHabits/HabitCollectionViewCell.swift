//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Apple on 12.05.2021.
//

import UIKit



class HabitCollectionViewCell: UICollectionViewCell {

    var delegateHabitCell: TestDelegate?


    var habit: Habit? {
        didSet{
           
            habitNameLabel.text = habit?.name
            timeLabel.text = habit?.dateString
            colorButtton1.layer.borderColor = habit?.color.cgColor
            habitNameLabel.textColor = habit?.color
            daysLabel.text = ("Подряд: \(habit!.trackDates.count)")
            
            if habit?.isAlreadyTakenToday == true {
              //  colorButtton1.tintColor = habitNameLabel.backgroundColor
                //colorButtton1.backgroundColor = habitNameLabel.backgroundColor
               // colorButtton1.setImage(.checkmark, for: .normal)
               
                      } else {
                      
                      }
        }
    }
        
    
    
    
 var habitNameLabel: UILabel = {
        var habitNameLabel = UILabel()
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.numberOfLines = 0
        habitNameLabel.font = .systemFont(ofSize: 15)
        return habitNameLabel
    }()
    
     var timeLabel: UILabel = {
        var timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .systemGray
        return timeLabel
    }()
     var daysLabel: UILabel = {
        var daysLabel = UILabel()
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.textColor = .systemGray
        return daysLabel
    }()
  lazy var colorButtton1: UIButton = {
        var colorButtton1 = UIButton(type: .system)
        colorButtton1.translatesAutoresizingMaskIntoConstraints = false
        colorButtton1.backgroundColor = .white
        colorButtton1.layer.borderWidth = 1
        colorButtton1.layer.cornerRadius = 18
        colorButtton1.layer.masksToBounds = true
        colorButtton1.addTarget(self, action: #selector(trackHabit), for: .touchUpInside)
     
        return colorButtton1
    }()
   
    
    
    @objc func trackHabit() {
          print(#function)
        
        
       // colorButtton1.tintColor = habit?.color
       // colorButtton1.backgroundColor = habit?.color
        //colorButtton1.setImage(.checkmark, for: .normal)
        
          if habit?.isAlreadyTakenToday == true {
            print("уже затрекана сегодня")
          } else {
            HabitsStore.shared.track(habit!)
            print("трекаем время привычки")
            contentView.reloadInputViews()

            self.delegateHabitCell?.updCollection()
         
          }
      }
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
            //  print("выполненан ли сегодня")
        //print(habit?.isAlreadyTakenToday)
        
        contentView.addSubview(habitNameLabel)
               contentView.addSubview(timeLabel)
               contentView.addSubview(daysLabel)
               contentView.addSubview(colorButtton1)
               contentView.backgroundColor = .white
               contentView.layer.cornerRadius = 8
               
               let constraints = [
                   
                   habitNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                   habitNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                habitNameLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -4),
                habitNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
                   
                   timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                   timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4),
                   timeLabel.heightAnchor.constraint(equalToConstant: 20),
                   
                   daysLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                   daysLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                   daysLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
                   daysLabel.heightAnchor.constraint(equalToConstant: 20),
                   
                colorButtton1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47),
                colorButtton1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47),
                colorButtton1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
                colorButtton1.widthAnchor.constraint(equalToConstant: 36)
                   
               ]
               NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
