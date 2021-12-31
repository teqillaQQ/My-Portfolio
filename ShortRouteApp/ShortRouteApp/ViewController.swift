//
//  ViewController.swift
//  ShortRouteApp
//
//  Created by Александр Савков on 30.12.21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    let addAdressButton: UIButton = {
        let addAdreas = UIButton()
        addAdreas.setTitle("Добавить", for: .normal)
        addAdreas.backgroundColor = .gray
        addAdreas.layer.cornerRadius = 25
        addAdreas.layer.borderWidth = 5
        addAdreas.layer.borderColor = UIColor.lightGray.cgColor
        addAdreas.translatesAutoresizingMaskIntoConstraints = false
        return addAdreas
    }()
    let routeButton: UIButton = {
        let routeButton = UIButton()
        routeButton.setTitle("Проложить", for: .normal)
        routeButton.backgroundColor = .gray
        routeButton.layer.cornerRadius = 25
        routeButton.layer.borderWidth = 5
        routeButton.layer.borderColor = UIColor.lightGray.cgColor
        routeButton.isHidden = true
        routeButton.translatesAutoresizingMaskIntoConstraints = false
        return routeButton
    }()
    let resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.setTitle("Сбросить", for: .normal)
        resetButton.backgroundColor = .gray
        resetButton.layer.cornerRadius = 25
        resetButton.layer.borderWidth = 5
        resetButton.layer.borderColor = UIColor.lightGray.cgColor
        resetButton.isHidden = true
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        return resetButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstrains()
        addAdressButton.addTarget(self, action: #selector(addAdressButtonTupped), for: .touchUpInside)
        routeButton.addTarget(self, action: #selector(routeButtonTupped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonTupped), for: .touchUpInside)
    }
    @objc func addAdressButtonTupped() {
        alertAddAdress(title: "Добавить", placeholder: "введите адрес") { (text) in
            print(text)
        }
    }
    @objc func routeButtonTupped() {
        print("route")
    }
    @objc func resetButtonTupped() {
        print("reset")
    }
}

extension ViewController {
    func setConstrains() {
        
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        mapView.addSubview(addAdressButton)
        NSLayoutConstraint.activate([
            addAdressButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 50),
            addAdressButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            addAdressButton.widthAnchor.constraint(equalToConstant: 110),
            addAdressButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        mapView.addSubview(routeButton)
        NSLayoutConstraint.activate([
            routeButton.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -100),
            routeButton.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            routeButton.widthAnchor.constraint(equalToConstant: 110),
            routeButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        mapView.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -100),
            resetButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            resetButton.widthAnchor.constraint(equalToConstant: 110),
            resetButton.heightAnchor.constraint(equalToConstant: 70)
        ])

    }
}


