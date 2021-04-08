//
//  UserDefaults.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 11.01.2021.
//

import SwiftyUserDefaults

extension DefaultsKeys {
    var needShowOnboarding: DefaultsKey<Bool> { .init("needShowOnboarding", defaultValue: true) }
}
