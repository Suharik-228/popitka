//
//  HabitViewController.swift
//  MyHabits2
//
//  Created by Suharik on 28.04.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    var timePicker = UIDatePicker()
    var colorPicker = UIColorPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Создать"
        view.backgroundColor = .white
        navigationItem.setRightBarButton(saveButton(title: "Сохранить", selector: #selector(buttonSaveAction), reverse: true) , animated: true)
        navigationItem.setLeftBarButton(cancelButton(title: "Отменить", selector: #selector(buttonCancelAction), reverse: true) , animated: true)
        nameTextField.delegate = self
        colorPicker.delegate = self
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(HabitViewController.timeChanged), for: .valueChanged)
        setupLayout()
    }
    
    var nameLabel: UILabel = {
        let name = UILabel()
        var text = "Название"
        name.text = text.uppercased()
        name.font = .boldSystemFont(ofSize: 13)
        name.textColor = .black
        return name
    }()
    
    var nameTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.leftViewMode = .always
        text.attributedPlaceholder = NSAttributedString.init(string: "Дуит!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3])
        return text
    }()
    
    var colorLabel: UILabel = {
        let color = UILabel()
        var textc = "Цвет"
        color.text = textc.uppercased()
        color.font = .boldSystemFont(ofSize: 13)
        color.textColor = .black
        return color
    }()
    
    var colorButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var timeLabel: UILabel = {
        let time = UILabel()
        var text = "Время"
        time.text = text.uppercased()
        time.font = .boldSystemFont(ofSize: 13)
        time.textColor = .black
        return time
    }()
    
    var timeTextField: UITextField = {
        var text = UITextField()
        text.backgroundColor = .white
        text.leftViewMode = .always
        text.text = "Каждый день в"
        text.isEnabled = false
        return text
    }()
    
    @objc func buttonPressed(color: UIColor) {
        present(colorPicker, animated: true, completion: nil)
    }
    
    @objc func timeChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        timeTextField.text = "Каждый день в \(dateFormatter.string(from: timePicker.date))"
    }
    
    @objc private func buttonAddAction() {
        present(HabitViewController(), animated: true)
    }
    
    func setupLayout(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeTextField.translatesAutoresizingMaskIntoConstraints = false
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        [nameLabel, nameTextField, colorLabel, colorButton, timeLabel, timeTextField, timePicker].forEach {view.addSubview($0)}
        NSLayoutConstraint.activate([
                                        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                                        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                        
                                        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
                                        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 18),
                                        
                                        colorLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
                                        colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                        
                                        colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 5),
                                        colorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                        
                                        timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 10),
                                        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                        
                                        timeTextField.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
                                        timeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
                                        
                                        timePicker.topAnchor.constraint(equalTo: timeTextField.bottomAnchor, constant: 5),
                                        timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)])
    }
    
    func cancelButton(title: String, selector: Selector, reverse: Bool) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.sizeToFit()
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
    
    func saveButton(title: String, selector: Selector, reverse: Bool) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.sizeToFit()
        button.setTitleColor(.systemPurple, for: .normal)
        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
    
    @objc private func buttonCancelAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func buttonSaveAction() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ colorPicker: UIColorPickerViewController) {
        colorButton.tintColor = colorPicker.selectedColor
        colorPicker.dismiss(animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidSelectColor(_ colorPicker: UIColorPickerViewController) {
        colorButton.tintColor = colorPicker.selectedColor
        colorPicker.dismiss(animated: true, completion: nil)
    }
}

extension HabitViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        view.endEditing(true)
        return true
    }
}

