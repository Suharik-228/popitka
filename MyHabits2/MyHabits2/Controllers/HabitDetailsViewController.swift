//
//  HabitDetailsViewController.swift
//  MyHabits2
//
//  Created by Suharik on 30.04.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let habit: Habit
    
    lazy var tableView = UITableView()
    let id = "mycell"
    //var arrayOfHabits = [HabitsStore.dates]
    
//    init(_ habit: Habit) {
//               self.habit = habit
//               super.init(nibName: nil, bundle: nil)
//           }
//   
//           required init?(coder: NSCoder) {
//               fatalError("init(coder:) has not been implemented")
//           }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Детали"
        //self.navigationController?.navigationBar.prefersLargeTitles = false
        //            HabitDetailsViewController.tableView.dataSource = self
        //            HabitDetailsViewController.tableView.delegate = self
        view.backgroundColor = .systemGray5
        self.navigationController?.navigationBar.barTintColor = .white
        navigationItem.setRightBarButton(editButton(title: "Править", selector: #selector(buttonEditAction), reverse: true) , animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.systemPurple
        createTable()
        setupLayout()
        
        
        //            navigationItem.leftBarButtonItem = leftBarButtonItem
        //            navigationItem.rightBarButtonItem = rightBarButtonItem

        //
        //            HabitDetailsViewController.tableView.register(
        //                HabitDetailTableViewCell.self,
        //                forCellReuseIdentifier: String(
        //                    describing: HabitDetailTableViewCell.self)
        //            )
        //        }
        //
        //
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//                super.viewDidAppear(animated)
//                title = habit.name
//            }
    
    var nameLabel: UILabel = {
        let name = UILabel()
        var text = "Активность"
        name.text = text.uppercased()
        name.font = .systemFont(ofSize: 17)
        name.textColor = .systemGray
        return name
    }()
    
    func setupLayout(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [nameLabel, tableView].forEach {view.addSubview($0)}
        NSLayoutConstraint.activate([
                                        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                                        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                        
                                        tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                                        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    
    func editButton(title: String, selector: Selector, reverse: Bool) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.sizeToFit()
        button.setTitleColor(.systemPurple, for: .normal)
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
    
            @objc func tapToCancel() {
                navigationController?.popViewController(animated: true)
            }
    
//            @objc func editHabit() {
//                navigationController?.pushViewController(HabitViewController(habit), animated: true)
//            }
    
    @objc private func buttonEditAction() {
        present(HabitViewController(), animated: true)
    }
    
    func createTable() {
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.textLabel?.text = "Это ячейка номер \(indexPath.row)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    

//
//        // MARK: METHODS ===================================================================================
//

//
//        private func setBarButton(title: String, action: Selector) -> UIBarButtonItem {
//            let button = UIBarButtonItem  (
//                title: title,
//                style: .plain ,
//                target: self,
//                action: action
//            )
//            button.tintColor = Colors.purpleColor
//            return button
//        }
//    }
//
//    extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HabitDetailTableViewCell.self), for: indexPath) as? HabitDetailTableViewCell else { return UITableViewCell() }
//            let date = HabitsStore.shared.dates[indexPath.row]
//            cell.setConfigureOfCell(index: indexPath.row, check: HabitsStore.shared.habit(habit, isTrackedIn: date))
//            return cell
//        }
//
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return HabitsStore.shared.dates.count
//        }
//
//        func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//        }
//
//        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            return Labels.activityLabel
//        }
//
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//    }
//
    
    
    //    extension HabitDetailsViewController: UITableViewDataSource {
    //        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //            return 4
    //        }
    //
    //        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
    //            let cell = tableView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProgressCollectionViewCell
    //            //        return cell
    //
    //            //        let cell2 = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
    //            //
    //            //        return cell2
    //            return cell
    //        }
    //
    ////        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    ////            var view = UIView()
    ////            view = profileHeaderView
    ////            return view
    ////        }
    //    }
    
}
