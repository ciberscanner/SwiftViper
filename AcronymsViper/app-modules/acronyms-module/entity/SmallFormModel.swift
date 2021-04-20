//
//  SmallFormModel.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import ObjectMapper

private let SF = "sf"
private let LFS = "lfs"

class SmallFormModel: Mappable {
    //--------------------------------------------------------------------
    //
    internal var sf:String?
    internal var lfs:[LongFormModel]?
    //--------------------------------------------------------------------
    //
    required init(map:Map){
        mapping(map: map)
    }
    //--------------------------------------------------------------------
    //
    init(sf:String, lfs: [LongFormModel]) {
        self.sf = sf
        self.lfs = lfs
    }
    //--------------------------------------------------------------------
    //
    func mapping(map: Map){
        sf <- map[SF]
        lfs <- map[LFS]
    }
}
