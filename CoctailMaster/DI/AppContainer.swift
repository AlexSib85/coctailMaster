//
//  AppContainer.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import DITranquillity

class AppContainer {
    static let shared: DIContainer = {
        let container = DIContainer()
        container.append(framework: AppFramework.self)
        container.append(framework: UIFramework.self)
        container.initializeSingletonObjects()

        if !container.makeGraph().checkIsValid(checkGraphCycles: true) {
            fatalError("invalid graph")
        }
        return container
    }()
}
