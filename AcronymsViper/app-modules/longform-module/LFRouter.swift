//
//  LFRouter.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import UIKit

class LFRouter: LFPresenterToRouterProtocol{
    //--------------------------------------------------------------------
    //Variables
    weak var viewController:LFViewController?
    //--------------------------------------------------------------------
    //
    init(viewController:LFViewController){
        self.viewController = viewController
    }
}
