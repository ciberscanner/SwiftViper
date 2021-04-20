//
//  LongFormProtocols.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import UIKit

protocol LFViewToPresenterProtocol: class {
    var view:LFPresenterToViewProtocol?{get set}
    var interactor: LFPresenterToInteractorProtocol?{get set}
    var router: LFPresenterToRouterProtocol?{get set}
}

protocol LFPresenterToViewProtocol: class {
    
}

protocol LFPresenterToRouterProtocol {
}

protocol LFPresenterToInteractorProtocol: class {
    var presenter:LFInteractorToPresenterProtocol?{get set}
}

protocol LFInteractorToPresenterProtocol: class {
}
protocol LFMainConfiguratorProtocol: class {
    func configure(with viewController: LFViewController)
}
