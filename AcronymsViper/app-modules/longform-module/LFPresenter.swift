//
//  LFPresenter.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import UIKit

class LFPresenter:LFViewToPresenterProtocol {
    //--------------------------------------------------------------------
    //Variables
    var view: LFPresenterToViewProtocol?
    var interactor: LFPresenterToInteractorProtocol?
    var router: LFPresenterToRouterProtocol?
    //--------------------------------------------------------------------
    //
    required init(view:LFPresenterToViewProtocol){
        self.view = view
    }
}

extension LFPresenter: LFInteractorToPresenterProtocol{

}
