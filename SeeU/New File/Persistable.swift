//
//  Persistable.swift
//  SeeU
//
//  Created by mac on 20.05.2020.
//  Copyright © 2020 sashabalabon. All rights reserved.
//

import Foundation

protocol Persistable{
    var ud: UserDefaults {get}
    var persistKey : String {get}
    func persist()
    func unpersist()
}
