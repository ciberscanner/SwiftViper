//
//  LFConfigurator.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation

class LFConfigurator: LFMainConfiguratorProtocol {
    func configure(with viewController: LFViewController) {
        let presenter = LFPresenter(view: viewController)
        let interactor = LFInteractor(presenter: presenter)
        let router = LFRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
