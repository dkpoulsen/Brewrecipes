//
//  BrewSearchTableViewController.swift
//  Brewrecipes
//
//  Created by Daniel K. Poulsen on 24/12/2017.
//  Copyright © 2017 dkp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

class BrewSearchTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let punk = PunkAPI()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView(){
        let scopeButtons = [SearchFilters.name, SearchFilters.hops, SearchFilters.malt]
        let scope = searchBar.rx.selectedScopeButtonIndex.map{scopeButtons[$0]}
        let text = searchBar.rx.text.asObservable().filterNil().filter{$0.count > 1}.startWith("")
        let searchDict = Observable.combineLatest(scope, text).map{[$0 : $1]}.do(onNext: {print($0)}).throttle(2, scheduler: MainScheduler.instance)
        let drivePunk = searchDict.flatMap{self.punk.search(search: $0)}.do(onError : {print($0)}).asDriver(onErrorJustReturn: [Beer]())
        
        drivePunk.drive(self.tableView.rx.items(cellIdentifier: "brewSearchCell", cellType: BrewSearchTableCell.self)){ _, beer, cell in
            cell.beer = beer
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Beer.self).asObservable().subscribe(onNext : { _ in
        }).disposed(by: disposeBag)
    }


}
