//
//  AcronymsViewController.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import UIKit

class AcronymsViewController: UIViewController {
    //--------------------------------------------------------------------
    //Variables
    var presenter:ViewToPresenterProtocol?
    var configurator:AcronymsConfigurator = AcronymsConfigurator()
    var formArrayList:Array<SmallFormModel> = Array()
    var lfsArrayList:Array<LongFormModel> = Array()
    let selfToAboutSegueName = "SegueToLF"
    
    @IBOutlet weak var textValue: UITextField!
    @IBOutlet weak var uiTable: UITableView!
    //--------------------------------------------------------------------
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    //--------------------------------------------------------------------
    //
    @IBAction func acronym(_ sender: Any) {
        if textValue.text?.isEmpty == false{
            self.presenter!.startFetchFormSF(text: textValue.text ?? "")
        }
        hideKeyboard()
    }
    //--------------------------------------------------------------------
    //
    @IBAction func initialism(_ sender: Any) {
        if textValue.text!.isEmpty == false{
            self.presenter?.startFetchFormLF(text: textValue.text ?? "")
        }
        hideKeyboard()
    }
    //--------------------------------------------------------------------
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter!.router!.prepare(for: segue, sender: sender)
    }
}

//MARK: -
extension AcronymsViewController:PresenterToViewProtocol{
    //--------------------------------------------------------------------
    //
    func showSmallForm(sfArray: Array<SmallFormModel>) {
        self.formArrayList = sfArray
        if sfArray.count>0{
            self.lfsArrayList = sfArray[0].lfs!
            uiTable.reloadData()
        }
    }
    //--------------------------------------------------------------------
    //
    func showError() {
        print("Error")
    }
    //--------------------------------------------------------------------
    //
    func hideKeyboard() {
        view.endEditing(true)
    }
}

//MARK: -UITableView Delegate & Data Source
extension AcronymsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lfsArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = lfsArrayList[indexPath.row].lf
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.sendLongForm(lf: lfsArrayList[indexPath.row])
    }
}
