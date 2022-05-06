//
//  HabitsViewController.swift
//  MyHabits2
//
//  Created by Suharik on 28.04.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    //UICollectionViewDataSource, UICollectionViewDelegate
    //    var collectionView = UICollectionView()
    //    var cellId = "Cell"
    
            var habit: Habit?
    
//            static var layout: UICollectionViewFlowLayout = {
//                let layout = UICollectionViewFlowLayout()
//                layout.minimumLineSpacing = Constants.indent
//                layout.scrollDirection = .vertical
//                layout.sectionInset = UIEdgeInsets(top: Constants.topSectionInset, left: 0, bottom: Constants.bottomSectionInset, right: 0)
//                return layout
//            }()
//
//            var collectionView: UICollectionView = {
//                let collection = UICollectionView(
//                    frame: .zero,
//                    collectionViewLayout: HabitsViewController.layout
//                )
//                collection.backgroundColor = Colors.lightGrayColor
//                collection.toAutoLayout()
//                collection.register(
//                    HabitCollectionViewCell.self,
//                    forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
//                collection.register(
//                    ProgressCollectionViewCell.self,
//                    forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))
//                return collection
//            }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Сегодня"
        view.backgroundColor = .systemGray5
        navigationItem.setRightBarButton(addButton(image: "plus", selector: #selector(buttonAddAction), reverse: true) , animated: true)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        //        collectionView.dataSource = self
        //        collectionView.delegate = self
        //        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        setupLayout()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//                collectionView.reloadData()
//            }
    
    var nameLabel: UILabel = {
        let name = UILabel()
        var text = "Название"
        name.text = text.uppercased()
        name.font = .boldSystemFont(ofSize: 13)
        name.textColor = .black
        return name
    }()
    
    var edit1Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil.circle"), for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(addNewHabit), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupLayout(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        edit1Button.translatesAutoresizingMaskIntoConstraints = false
        [nameLabel, edit1Button].forEach {view.addSubview($0)}
        NSLayoutConstraint.activate([
                                        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                                        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                        
                                        edit1Button.topAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.topAnchor, constant: 20),
                                        edit1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)])
    }
    
    func addButton(image: String, selector: Selector, reverse: Bool) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .systemPurple
        button.setTitleColor(.systemPurple, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.sizeToFit()
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
    
    @objc private func buttonAddAction() {
        let rootVC = HabitViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
    }
    
//    @objc func buttonPressed(color: UIColor) {
//        let navVC = HabitDetailsViewController()
//        self.navigationController?.pushViewController(navVC, animated: true)
//    }
    
            @objc func addNewHabit() {
                self.navigationController?.pushViewController(HabitDetailsViewController(), animated: true)
            }
    
    
// 
//
//
//        // MARK: PROPERTIES ============================================================================
//

//
//        // MARK: INITIALIZATORS ============================================================================
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            let rightBarButtonItem = UIBarButtonItem(
//                image: UIImage(systemName: "plus"),
//                style: .plain ,
//                target: self,
//                action: #selector(addNewHabit))
//            rightBarButtonItem.tintColor = Colors.purpleColor
//            navigationItem.rightBarButtonItem = rightBarButtonItem
//            collectionView.dataSource = self
//            collectionView.delegate = self
//            setupContent()
//        }
//
//
//
//        // MARK: METHODS ===================================================================================
//
//        private func setupContent() {
//            view.addSubview(collectionView)
//            NSLayoutConstraint.activate([
//                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ])
//        }
//

//    }
//
//    extension HabitsViewController: UICollectionViewDataSource {
//
//        func numberOfSections(in collectionView: UICollectionView) -> Int {
//            return 2
//        }
//
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            var sectionsCount = 0
//            switch section {
//            case 0:
//                sectionsCount = 1
//            case 1:
//                sectionsCount = HabitsStore.shared.habits.count
//            default:
//                break
//            }
//            return sectionsCount
//        }
//
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            switch indexPath.section {
//            case 0:
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressCollectionViewCell.self), for: indexPath) as? ProgressCollectionViewCell else { return UICollectionViewCell() }
//                cell.setupContent()
//                return cell
//            case 1:
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HabitCollectionViewCell.self), for: indexPath) as? HabitCollectionViewCell else { return UICollectionViewCell() }
//                cell.setConfigureOfCell(habit: HabitsStore.shared.habits[indexPath.row])
//
//                cell.habitCheckerAction = { [weak self] in
//                    self?.collectionView.reloadData()
//                }
//
//                return cell
//            default:
//                return UICollectionViewCell()
//            }
//        }
//
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//            guard indexPath != [0,0] else { return }
//                let habitDetailsViewController = HabitDetailsViewController(HabitsStore.shared.habits[indexPath.row])
//                navigationController?.pushViewController(habitDetailsViewController, animated: true)
//                collectionView.deselectItem(at: indexPath, animated: true)
//        }
//    }
//
//    extension HabitsViewController: UICollectionViewDelegateFlowLayout {
//
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            var height: CGFloat = 0
//            switch indexPath.section {
//            case 0:
//                height = Constants.heightFor0Section
//            case 1:
//                height = Constants.heightFor1Section
//            default:
//                break
//            }
//            return CGSize(width: floor(collectionView.frame.width - 32), height: height)
//        }
//    }
    
    
    
    
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return 1
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProgressCollectionViewCell
    //        return cell
    //    }
    //}
    //
    //class ProgressCollectionViewCell: UICollectionViewCell {
    //    //var progressLine = UIProgressView()
    //    var nameLabel: UILabel = {
    //    let name = UILabel()
    //    var text = "Название"
    //    name.text = textc.uppercased()
    //    name.font = .boldSystemFont(ofSize: 13)
    //    name.textColor = .black
    //    return name
    //    }()
}

