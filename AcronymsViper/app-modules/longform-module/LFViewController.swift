//
//  LFViewController.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import UIKit

class LFViewController: UIViewController {
    //--------------------------------------------------------------------
    //Variables
    var lfsArrayList:Array<LongFormModel> = Array()
    var longform: LongFormModel?
    var presenter:LFViewToPresenterProtocol?
    var configurator:LFConfigurator = LFConfigurator()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    //--------------------------------------------------------------------
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        if (longform != nil){
            titleLabel.text = longform!.lf
            lfsArrayList = (longform?.vars)!
        }
    }
}

//MARK: -
extension LFViewController: LFPresenterToViewProtocol{
}

//MARK: -UITableView Delegate & Data Source
extension LFViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lfsArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "identifier")
        cell.textLabel?.text = lfsArrayList[indexPath.row].lf
        cell.detailTextLabel?.text = "Frequency: \(lfsArrayList[indexPath.row].freq ?? 0) Since: \(lfsArrayList[indexPath.row].since ?? 0)"
        return cell
    }
}
