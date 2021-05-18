//
//  HabitDetailViewCellTableViewCell.swift
//  MyHabits
//
//  Created by Apple on 14.05.2021.
//

import UIKit

class HabitDetailViewCell: UITableViewCell {

    var trackedDay: UILabel = {
           var day = UILabel()
       
           day.translatesAutoresizingMaskIntoConstraints = false

          return day
       }()
    
    var checkMark: UILabel = {
        var check = UILabel()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.text = "✓"
        check.textColor = .purple
        check.textAlignment = .right
        check.isHidden = true
        return check
    }()
    
    
    
    
       func setupViews() {
           contentView.addSubview(trackedDay)
           contentView.addSubview(checkMark)
           let constraints = [
               trackedDay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
               trackedDay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
               trackedDay.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
               trackedDay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            checkMark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            checkMark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            checkMark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            checkMark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
           ]
           NSLayoutConstraint.activate(constraints)
       }
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupViews()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
       

}
