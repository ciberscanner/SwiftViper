//
//  LFInteractor.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation

class LFInteractor: LFPresenterToInteractorProtocol {
    //--------------------------------------------------------------------
    //Variables
    var presenter : LFInteractorToPresenterProtocol?
    //--------------------------------------------------------------------
    //
    required init(presenter: LFInteractorToPresenterProtocol){
        self.presenter = presenter
    }
}
