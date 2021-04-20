//
//  AcronymsProtocols.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchFormSF(text: String)
    func startFetchFormLF(text: String)
    func hideKeyboard()
    func sendLongForm(lf: LongFormModel)
}

protocol PresenterToViewProtocol: class {
    func showSmallForm(sfArray: Array<SmallFormModel> )
    func showError()
}

protocol PresenterToRouterProtocol: class {
    func showLFViewController(on view: PresenterToViewProtocol, with lf: LongFormModel)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchFormSF(text: String)
    func fetchFormLF(text: String)
}

protocol InteractorToPresenterProtocol: class {
    func formFetchedSuccess(sfArray: Array<SmallFormModel>)
    func formFetchFailed()
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: AcronymsViewController)
}

enum ErrorMessages: Error {
    case noInternet
    case NoTrainsFound
    case NoTrainAvailbilityFromSource
    case InvalidSourceAndDestination
}
