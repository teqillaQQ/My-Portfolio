//
//  StartTVC.swift
//  InterboxWeatherApp
//
//  Created by Александр Савков on 26.12.21.
//

import UIKit

class StartTVC: UITableViewController {
    
    let emptyCity = Weather()
    var cityArray = [Weather]()
    var filterCityArray = [Weather]()
    var cityNameArray = [
        "Минск",
        "Могилев",
        "Брест",
        "Гомель",
        "Гродно",
        "Витебск",
        "Солигорск",
        "Браслав",
        "Полоцк",
        "Мозырь",
    ]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if cityArray.isEmpty {
            cityArray = Array(repeating: emptyCity, count: cityNameArray.count)
        }
        addSityes()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @IBAction func allertPtusCity(_ sender: UIBarButtonItem) {
        allerCity(name: "Город", placeholder: "Введите название города") { (city) in
            self.cityNameArray.append(city)
            self.cityArray.append(self.emptyCity)
            self.addSityes()
        }
    }
    
    func addSityes() {
        getCityWeather(cityArray: self.cityNameArray) { index, weather in
            
            self.cityArray[index] = weather
            self.cityArray[index].name = self.cityNameArray[index]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filterCityArray.count
        }
        return cityArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ListCell
        var weather = Weather()
        
        if isFiltering {
            weather = filterCityArray[indexPath.row]
        } else {
            weather = cityArray[indexPath.row]
        }
        cell.configure(weather: weather)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (_, _, completionHandler) in
            let editingRow = self.cityNameArray[indexPath.row]
            
            if let index = self.cityNameArray.firstIndex(of: editingRow) {
                
                if self.isFiltering {
                    self.filterCityArray.remove(at: index)
                } else {
                    self.cityArray.remove(at: index)
                }
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDelail" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            if isFiltering {
                let filter = filterCityArray[indexPath.row]
                let detVC = segue.destination as! DetaillVCViewController
                detVC.weatherModel = filter
            } else {
                let cityWeather = cityArray[indexPath.row]
                let detVC = segue.destination as! DetaillVCViewController
                detVC.weatherModel = cityWeather
            }
        }
    }
}

extension StartTVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearch(searchController.searchBar.text!)
    }
    
    private func filterContentForSearch(_ searchText: String) {
        
        filterCityArray = cityArray.filter {
            $0.name.contains(searchText)
            
        }
        tableView.reloadData()
    }
}
