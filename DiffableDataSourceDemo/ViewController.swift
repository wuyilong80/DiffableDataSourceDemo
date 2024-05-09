//
//  ViewController.swift
//  DiffableDataSourceDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/5/9.
//

import UIKit
import SnapKit

enum Section {
    case car
}

struct Car: Hashable {
    var brand: String
    var color: UIColor
}

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(CarTableViewCell.self))
        tableView.delegate = self
        return tableView
    }()
    
    var dataSource: UITableViewDiffableDataSource<Section, Car>!
    var cars: [Car] = [
        Car(brand: "Benz", color: .black),
        Car(brand: "BMW", color: .green),
        Car(brand: "NISSAN", color: .blue),
        Car(brand: "TOYOTA", color: .yellow)
    ]
    var tempCar: Car = Car(brand: "Honda", color: .red)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        updateTableView()
    }

    func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func updateTableView() {
        
        dataSource = UITableViewDiffableDataSource<Section, Car>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CarTableViewCell.self), for: indexPath)
            if let cell = cell as? CarTableViewCell {
                cell.nameLabel.text = itemIdentifier.brand
                cell.imgView.backgroundColor = itemIdentifier.color
            }
            return cell
        }
        tableView.dataSource = dataSource
        var snapshot = NSDiffableDataSourceSnapshot<Section, Car>()
        snapshot.appendSections([.car])
        snapshot.appendItems(cars)
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        let selectdCar = cars[indexPath.row]
        cars[indexPath.row] = tempCar
        tempCar = selectdCar
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Car>()
        snapshot.appendSections([.car])
        snapshot.appendItems(cars)
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
}
