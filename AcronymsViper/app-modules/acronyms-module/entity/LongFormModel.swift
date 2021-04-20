//
//  LongFormModel.swift
//  AcronymsViper
//
//  Created by Diego Fernando Serna Salazar on 19.04.21.
//

import Foundation
import ObjectMapper

private var LF = "lf"
private var FREQ = "freq"
private var VARS = "vars"
private var SINCE = "since"

class LongFormModel: Mappable {
    //--------------------------------------------------------------------
    //
    internal var lf:String?
    internal var freq:Int?
    internal var vars:[LongFormModel]?
    internal var since:Int?
    //--------------------------------------------------------------------
    //
    required init?(map:Map){
        mapping(map: map)
    }
    //--------------------------------------------------------------------
    //
    func mapping(map:Map){
        lf <- map[LF]
        freq <- map[FREQ]
        vars <- map[VARS]
        since <- map[SINCE]
    }
}
