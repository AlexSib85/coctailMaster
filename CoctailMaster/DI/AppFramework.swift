//
//  AppFramework.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import DITranquillity

public class AppFramework: DIFramework {
    public static func load(container: DIContainer) {
        container.register { NetworkServiceImpl() }
            .as(NetworkService.self)
            .lifetime(.single)
    }
}
