//
//  AcronymsPresenter.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import UIKit

class AcronymsPresenter:ViewToPresenterProtocol {
    //--------------------------------------------------------------------
    //Variables
    weak var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    //--------------------------------------------------------------------
    //
    required init(view:PresenterToViewProtocol){
        self.view = view
    }
    //--------------------------------------------------------------------
    //
    init(){
    }
    //--------------------------------------------------------------------
    //
    func startFetchFormSF(text: String) {
        interactor?.fetchFormSF(text: text)
    }
    //--------------------------------------------------------------------
    //
    func startFetchFormLF(text: String) {
        interactor?.fetchFormLF(text: text)
    }
    //--------------------------------------------------------------------
    //
    func sendLongForm(lf: LongFormModel) {
        router?.showLFViewController(on: view!, with: lf)
    }
    
    func hideKeyboard() {
    }
}

extension AcronymsPresenter: InteractorToPresenterProtocol{
    func formFetchedSuccess(sfArray: Array<SmallFormModel>){
        view?.showSmallForm(sfArray: sfArray)
    }
    
    func formFetchFailed(){
        view?.showError()
    }
}
