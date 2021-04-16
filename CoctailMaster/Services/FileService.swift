//
//  FileService.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 15.04.2021.
//

import Foundation

class FileService<Stored: Codable> {

    private var fileName: String

    init(fileName: String) {
        self.fileName = fileName
    }

    func loadData() -> [Stored] {
        var loadedObjects: [Stored] = []
        if let cacheData = try? Data(contentsOf: URL(fileURLWithPath: cacheFilePath)),
           let objects = try? JSONDecoder().decode([Stored].self, from: cacheData) {

            for object in objects {
                loadedObjects.append(object)
            }
        }
        return loadedObjects
    }

    func saveData(stored: [Stored]) {
        guard let data = try? JSONEncoder().encode(stored) else {
            return
        }
        try? data.write(to: URL(fileURLWithPath: cacheFilePath))
    }

    private var cacheFilePath: String {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        return path + "/\(fileName).json"
    }
}
