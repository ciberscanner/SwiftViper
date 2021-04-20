//
//  AcronymsRouter.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import UIKit

class AcronymsRouter: PresenterToRouterProtocol {
    //--------------------------------------------------------------------
    //Variables
    weak var viewController:AcronymsViewController?
    var lf: LongFormModel?
    //--------------------------------------------------------------------
    //
    init(viewController:AcronymsViewController){
        self.viewController = viewController
    }
    //--------------------------------------------------------------------
    //
    func showLFViewController(on view: PresenterToViewProtocol, with lf: LongFormModel) {
        self.lf = lf
        viewController!.performSegue(withIdentifier: viewController!.selfToAboutSegueName, sender: nil)
    }
    //--------------------------------------------------------------------
    //
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let lfViewController = segue.destination as? LFViewController
        lfViewController!.longform = lf
    }
}
