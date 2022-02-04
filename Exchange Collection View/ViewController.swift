//
//  ViewController.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 28.01.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //MARK: - setup let/var
    //array for numbers input field (этот массив хранит введенные символы)
    var inputTextField: String?
    
    //current rate to calculate (текущий rate)
    var currentRate: Double?
    
    //set number of active View (переменная, которая хранит номер активного элемента scrollView. при запуске 1,1)
    var topViewScrollNumber = 1
    var bottomViewScrollNumber = 1
    
    // объекты верхней и нижней коллекции
    var topBoxView = CustomCollectionView()
    var bottomBoxView = CustomCollectionView()
    
    //    var structCurrency: Rates? //if we need use rates only
    static var dataSource: Data?
        
    private let scrollViewHeight: CGFloat = 150
        
        
    //params for Alamofire
    private var url = "http://api.exchangeratesapi.io/latest?access_key=7e9f2e1f655a573e5189f16d2cb00a85"
    var timer: DispatchSourceTimer?

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(topBoxView)
        view.addSubview(bottomBoxView)
        setupView()
        
        //метод возвращает массив валют
        topBoxView.setModel(cells: CurrencyViewModel.fetchModel())
        bottomBoxView.setModel(cells: CurrencyViewModel.fetchModel())
        
        //is first start app? if true - set start balance
//        userDefaults()
        
        //setup Exchange button
//        let exchangeButton = UIBarButtonItem(title: "Exchange", style: .plain, target: self, action: #selector(exchangeButtonPressed))
//        navigationItem.rightBarButtonItem = exchangeButton
        
        // (получить курсы валют при запуске приложения)
//        getRateTimer()
        
        getExchangeRate(url: url)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("selected")
    }
    
    func setupView() {
        
        //set delegates for input recognize
        //TODO: - в классе коллекции делегатов - достаточно? отсюда убрать?
//        topBoxView.delegate = self
//        bottomBoxView.delegate = self
        
        topBoxView.tag = 1
        bottomBoxView.tag = 2

        
        title = "Exchange"
        view.backgroundColor = .white
        let constraints = [
            topBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBoxView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topBoxView.heightAnchor.constraint(equalToConstant: 150),
            
            bottomBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBoxView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            bottomBoxView.heightAnchor.constraint(equalToConstant: 150),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    

}

extension ViewController: UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width + 1)
//        print(page)
        
        //TODO: - Как правильно инициализировать переменную без значения? В этом случае, при выполнении switch ошибка "переменная используется до инициализации"
        var page = 1
        // номер видимой ячейки
        for cell in topBoxView.visibleCells {
            let indexPath = topBoxView.indexPath(for: cell)
            if let indexPath = indexPath {
                page = indexPath.row + 1
                print(page)
                }
            }
        
        //TODO: - Как правильно обнулить значения label-ов в ячейке неактивного вью? Нужно создать метод в СustomCollectionView и вызывать его отсюда?
        switch scrollView.tag {
        case 1:
            if page != topViewScrollNumber {
                // clear textFields, and inputed symbols after any scroll (очищает поле ввода\вывода + очищает введенные символы из хранилища)
                // ...
            }
            else {
                print("слайд: \(page)")
                print("верхний сладер")
                topViewScrollNumber = page
            }
        case 2:
            if page != topViewScrollNumber {
                // ...
            }
            else {
                print("слайд: \(page)")
                print("нижний слайдер")
                bottomViewScrollNumber = page
            }
            
        default:
            return
        }
        
//        changeCurrencyRates()
        
    }
    //MARK: - Calculate currency rates
    //Change currency rates in title and label
//    func changeCurrencyRates() {
//        
//        var fromRate = 0.0 //rate валюты, которая находится на верхнем UIScrollView
//        var toRate = 0.0 //rate валюты, которая находится на нижнем UIScrollView
//        
//        var topSymbol = "" //символ валюты, которая находится на верхнем UIScrollView
//        var bottomSymbol = "" //символ валюты, которая находится на нижнем UIScrollView
//        
//        //test
//        var currentCell: UICollectionViewCell?
//        
//        
//
//        
//        
//        //TODO: - как обратиться к текущей видимой ячейке, чтобы поменять значения ее label-ов?
//        
//        // 2 switch-a, которые перебирают номер текущего отображаемого scrollView сверху и снизу
//        switch topViewScrollNumber {
//        case 1:
//            //USD
//            fromRate = self.dataSource?.rates.USD ?? 0 // достает из текущей версии Data рейт валюты
//            self.topBoxView = self.topScrollView.usdBoxView // присваивает объект текущего view для того, чтобы присвоить его label-ам значения rate
//            topSymbol = "$" // символ валюты, который будет использован для label в title и topBox и bottomBox
//        case 2:
//            //EUR
//            fromRate = self.dataSource?.rates.EUR ?? 0
//            self.topBoxView = self.topScrollView.eurBoxView
//            topSymbol = "€"
//
//        case 3:
////            let rate = topScrollView.gbpBoxView.exchangeRate.text
//            fromRate = self.dataSource?.rates.GBP ?? 0
//            self.topBoxView = self.topScrollView.gbpBoxView
//            topSymbol = "£"
//
//        default:
//            break
//        }
//        
//        switch bottomViewScrollNumber {
//        case 1:
//            //USD
//            toRate = self.dataSource?.rates.USD ?? 0
//            self.bottomBoxView = self.bottomScrollView.usdBoxView
//            bottomSymbol = "$"
//        case 2:
//            //EUR
//            toRate = self.dataSource?.rates.EUR ?? 0
//            self.bottomBoxView = self.bottomScrollView.eurBoxView
//            bottomSymbol = "€"
//
//        case 3:
////            let rate = topScrollView.gbpBoxView.exchangeRate.text
//            toRate = self.dataSource?.rates.GBP ?? 0
//            self.bottomBoxView = self.bottomScrollView.gbpBoxView
//            bottomSymbol = "£"
//
//        default:
//            break
//            }
//        //Calculate actual rate
//
//        let topViewCourse = String(format: "%.2f",toRate/fromRate) //rate для валюты, которая выбрана в верхнем scrollView, считается относительно выбранной валюты в нижем scrollView
//        let bottomViewCourse = String(format: "%.2f",fromRate/toRate) //rate для валюты, которая выбрана в нижнем scrollView
//        currentRate = toRate/fromRate
//
//        //Update UI
//        DispatchQueue.main.async {
//            //update rate to title and labels
//            self.topBoxView?.exchangeRate.text = "1\(topSymbol) = \(bottomSymbol) \(topViewCourse)"
//            self.bottomBoxView?.exchangeRate.text = "1\(bottomSymbol) = \(topSymbol) \(bottomViewCourse)"
//            self.title = self.topBoxView?.exchangeRate.text
//        }
//    }
    


//MARK: - Alamofire
func getExchangeRate(url: String) {
    
    AF.request(url).responseDecodable(of: Data.self) { response in
        switch response.result {
        case .success(let value):
            ViewController.dataSource = value
            //self.structCurrency = value.rates // if we need use rates only
            DispatchQueue.main.async {
                if ViewController.dataSource != nil {
//                        self.updateUI(dataSource: dataSource)
                    self.topBoxView.reloadData()
                    self.bottomBoxView.reloadData()
                    print("network done")
                }
            }
        case .failure(let error):
            print("ОШИБКА: \(error)")
        }
    }
}


}
