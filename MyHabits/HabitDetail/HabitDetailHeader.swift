//
//  HabitDetailHeader.swift
//  MyHabits
//
//  Created by Apple on 14.05.2021.
//

import UIKit


class HabitDetailHeader: UITableViewHeaderFooterView {
    
    var titleLabel: String? {
        didSet {
            habitActivityLabel.text = titleLabel
        }
    }
    
    let habitActivityLabel: UILabel = {
        let activity = UILabel()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.text = "АКТИВНОСТЬ"
        activity.font = .systemFont(ofSize: 13)
        activity.textColor = .darkGray
        return activity
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(habitActivityLabel)
        
        let constraints = [
            habitActivityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            habitActivityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            habitActivityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            habitActivityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
