//
//  AcronymsInteractor.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import Alamofire
import ObjectMapper

class AcronymsInteractor: PresenterToInteractorProtocol {
    //--------------------------------------------------------------------
    //Variables
    var presenter: InteractorToPresenterProtocol?
    //--------------------------------------------------------------------
    //
    required init(presenter: InteractorToPresenterProtocol){
        self.presenter = presenter
    }
    //--------------------------------------------------------------------
    //
    func fetchFormSF(text: String) {
        fetchForm(text: text, query: SFQuery)
    }
    //--------------------------------------------------------------------
    //
    func fetchFormLF(text: String) {
        fetchForm(text: text, query: LFQuery)
    }
    //--------------------------------------------------------------------
    //
    func fetchForm(text: String, query: String) {
        let url = API+query+text
        let fixedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        AF.request("\(fixedUrl ?? url)").responseJSON{ response in
            if(response.response?.statusCode == 200){
                if let json = response.value as AnyObject?{
                    let arrayResponse = json as! NSArray
                    let arrayObject = Mapper<SmallFormModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]])
                    if arrayObject.count>0{
                        self.presenter?.formFetchedSuccess(sfArray: arrayObject)
                    }
                }
            }
            else{
                self.presenter?.formFetchFailed()
            }
        }
    }
}
