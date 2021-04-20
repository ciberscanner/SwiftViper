//
//  AcronymsConfigurator.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import UIKit

class AcronymsConfigurator: MainConfiguratorProtocol {
    
    func configure(with viewController: AcronymsViewController) {
        let presenter = AcronymsPresenter(view: viewController)
        let interactor = AcronymsInteractor(presenter: presenter)
        let router = AcronymsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
