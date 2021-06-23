//
//  Protocols.swift
//  MyHabits
//
//  Created by Apple on 08.05.2021.
//


protocol TestDelegate: class {
    func updCollection()
}

protocol ProtocolForCallFromCorrectToDetail: class {
    func callFromCorrectToDetailPopToRoot()
    func updateTitle(newTitle: String)
    func updateHabitsCollection()
}
