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

        container.register { FileService<DrinkModel>(fileName: Constant.favoriteDrinksFileName) }

        container.register { DataServiceImpl(networkService: $0, drinksFileService: $1) }
            .as(DataService.self)
            .lifetime(.single)
    }
}
