//
//  AcronymsDataTest.swift
//  AcronymsViperTests
//
//  Created by Diego Fernando Serna Salazar on 20.04.21.
//

import XCTest
import ObjectMapper
import SwiftyJSON
@testable import AcronymsViper

class AcronymsDataTest: XCTestCase {
    //--------------------------------------------------------------------
    //Variables
    var presenter: AcronymsPresenter!
    var view = AcronymsMockView()
    var interactor = AcronymsInteractorMock()
    //--------------------------------------------------------------------
    //
    override func setUp() {
        presenter = AcronymsPresenter()
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    //--------------------------------------------------------------------
    //
    func testFetchFormSF() {
        presenter.startFetchFormLF(text: "IDE")
        if !view.isSaveFetchedCalled {
            XCTFail("saveFetchedStations func not called")
        }
    }
    override func tearDown() {
        presenter = nil
    }}

//MARK: -
class AcronymsMockView:PresenterToViewProtocol {
    var isSaveFetchedCalled = false
    func showSmallForm(sfArray: Array<SmallFormModel>) {
        isSaveFetchedCalled = true
    }
    func showError() {
        
    }
}
//MARK: -
class AcronymsInteractorMock: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    let json = """
[{"sf": "IDE", "lfs": [{"lf": "insulin-degrading enzyme", "freq": 165, "since": 1980, "vars": [{"lf": "insulin-degrading enzyme", "freq": 100, "since": 1984}, {"lf": "Insulin-degrading enzyme", "freq": 29, "since": 1980}, {"lf": "insulin degrading enzyme", "freq": 24, "since": 1984}, {"lf": "Insulin degrading enzyme", "freq": 10, "since": 1991}, {"lf": "insulin degradation enzyme", "freq": 1, "since": 2005}, {"lf": "Insulin Degradation Enzyme", "freq": 1, "since": 2003}]}, {"lf": "Investigational Device Exemption", "freq": 41, "since": 1980, "vars": [{"lf": "Investigational Device Exemption", "freq": 17, "since": 1982}, {"lf": "investigational device exemption", "freq": 17, "since": 1980}, {"lf": "investigational device exemptions", "freq": 3, "since": 1999}, {"lf": "Investigational Device Exemptions", "freq": 3, "since": 1997}, {"lf": "investigation device exemption", "freq": 1, "since": 2007}]}, {"lf": "inner dental epithelium", "freq": 17, "since": 1985, "vars": [{"lf": "inner dental epithelium", "freq": 9, "since": 1987}, {"lf": "inner dental epithelial", "freq": 8, "since": 1985}]}, {"lf": "iron deficient erythropoiesis", "freq": 9, "since": 1998, "vars": [{"lf": "iron deficient erythropoiesis", "freq": 3, "since": 1999}, {"lf": "iron deficiency erythropoiesis", "freq": 3, "since": 2001}, {"lf": "iron-deficient erythropoiesis", "freq": 2, "since": 2002}, {"lf": "Iron-deficient erythropoiesis", "freq": 1, "since": 1998}]}, {"lf": "desmosine (DES) and isodesmosine", "freq": 6, "since": 1987, "vars": [{"lf": "desmosine (DES) and isodesmosine", "freq": 6, "since": 1987}]}, {"lf": "idebenone", "freq": 5, "since": 1999, "vars": [{"lf": "idebenone", "freq": 3, "since": 1999}, {"lf": "Idebenone", "freq": 2, "since": 2006}]}, {"lf": "interdigitated electrode", "freq": 4, "since": 2005, "vars": [{"lf": "interdigitated electrode", "freq": 1, "since": 2006}, {"lf": "interdigital electrode", "freq": 1, "since": 2007}, {"lf": "interdigitated electrodes", "freq": 1, "since": 2008}, {"lf": "interdigital electrodes", "freq": 1, "since": 2005}]}]}]
"""
    
    func fetchFormSF(text: String) {
        let jsonData = json.data(using: .utf8)!
        if let json = jsonData as AnyObject?{
            let arrayResponse = json as! NSArray
            let arrayObject = Mapper<SmallFormModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]])
            if arrayObject.count>0{
                self.presenter?.formFetchedSuccess(sfArray: arrayObject)
            }
        }
    }
    
    func fetchFormLF(text: String) {
        if let dataFromString = json.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            let json2 = try! JSON(data: dataFromString)
            let arrayObject = Mapper<SmallFormModel>().mapArray(JSONArray: json2.arrayObject as! [[String : Any]])
            if arrayObject.count>0{
                self.presenter?.formFetchedSuccess(sfArray: arrayObject)
            }
        }
    }
}
