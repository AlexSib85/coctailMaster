//
//  CommonUtils.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 03.01.2021.
//

import Foundation

func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

@available(iOS, deprecated: 1.0, message: "I'm not deprecated, please ***FIXME***")
func FIXME() {}

#if DEBUG
    let IsDebugMode = true
#else
    let IsDebugMode = false
#endif
