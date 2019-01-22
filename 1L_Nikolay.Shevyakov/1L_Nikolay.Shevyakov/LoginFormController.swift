//
//  LoginFormController.swift
//  1L_Nikolay.Shevyakov
//
//  Created by Nikolay Shevyakov on 18.12.2018.
//  Copyright © 2018 jasno. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Жест нажатия
        let hideKeyBoardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        //присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyBoardGesture)

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //проверяем данне
        let checkResult = checkUserData()
        //Если данные неверны? покажем ошибку
        if !checkResult {
            showLoginError()
        }
        //Вернем результат
        return checkResult
    }
    
    func checkUserData()->Bool{
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "1" && password == "1" {
            return true
        }else{
            return false
        }
    }
    func showLoginError(){
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        //Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "ОК", style:.cancel, handler:nil)
        //Добавляем кнопку на UIAlertController
        alter.addAction(action)
        //Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        //Получаем текст логина
        let login = loginInput.text!
        //Получаем текст пароль
        let password = passwordInput.text!
        
        //Проверяем, верны ли они
        if login == "1" && password == "1"{
            print("Успешная авторизация")
        }else{
            print("не удалось авторизоваться")
        }
    }
    
    //Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsents = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        //Добавляем отступ внизу  UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsents
        scrollView?.scrollIndicatorInsets = contentInsents
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification){
        //Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Подписываемся на 2 уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        //Второе - когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
}


@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

