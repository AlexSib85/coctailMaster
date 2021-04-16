//
//  DrinkModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 14.04.2021.
//

import Foundation

struct DrinkModel: Codable, Equatable {

    var id: Int
    var title: String
    var isFavorite: Bool
    var alternateTitle: String?
    var tags: String?
    var videoURLString: String?
    var category: String?
    var ibaTitle: String?
    var alcogolic: String?
    var glassType: String?
    var instructions: String?
    var thumbURLString: String?
//    var strIngredient1: String?
//    var strIngredient2: String?
//    var strIngredient3: String?
//    var strIngredient4: String?
//    var strIngredient5: String?
//    var strIngredient6: String?
//    var strIngredient7: String?
//    var strIngredient8: String?
//    var strIngredient9: String?
//    var strIngredient10: String?
//    var strIngredient11: String?
//    var strIngredient12: String?
//    var strIngredient13: String?
//    var strIngredient14: String?
//    var strIngredient15: String?
//    var strMeasure1: String?
//    var strMeasure2: String?
//    var strMeasure3: String?
//    var strMeasure4: String?
//    var strMeasure5: String?
//    var strMeasure6: String?
//    var strMeasure7: String?
//    var strMeasure8: String?
//    var strMeasure9: String?
//    var strMeasure10: String?
//    var strMeasure11: String?
//    var strMeasure12: String?
//    var strMeasure13: String?
//    var strMeasure14: String?
//    var strMeasure15: String?
//    var strImageSource: String?
//    var strImageAttribution: String?
//    var strCreativeCommonsConfirmed: String?
    var dateModified: String?

    init(drink: Drink) {
        self.id = Int(drink.idDrink) ?? 0
        self.title = drink.strDrink
        self.alternateTitle = drink.strDrinkAlternate
        self.tags = drink.strTags
        self.videoURLString = drink.strVideo
        self.category = drink.strCategory
        self.ibaTitle = drink.strIBA
        self.alcogolic = drink.strAlcoholic
        self.glassType = drink.strGlass
        self.instructions = drink.strInstructions
        self.thumbURLString = drink.strDrinkThumb
//        self.strIngredient1 = strIngredient1
//        self.strIngredient2 = strIngredient2
//        self.strIngredient3 = strIngredient3
//        self.strIngredient4 = strIngredient4
//        self.strIngredient5 = strIngredient5
//        self.strIngredient6 = strIngredient6
//        self.strIngredient7 = strIngredient7
//        self.strIngredient8 = strIngredient8
//        self.strIngredient9 = strIngredient9
//        self.strIngredient10 = strIngredient10
//        self.strIngredient11 = strIngredient11
//        self.strIngredient12 = strIngredient12
//        self.strIngredient13 = strIngredient13
//        self.strIngredient14 = strIngredient14
//        self.strIngredient15 = strIngredient15
//        self.strMeasure1 = strMeasure1
//        self.strMeasure2 = strMeasure2
//        self.strMeasure3 = strMeasure3
//        self.strMeasure4 = strMeasure4
//        self.strMeasure5 = strMeasure5
//        self.strMeasure6 = strMeasure6
//        self.strMeasure7 = strMeasure7
//        self.strMeasure8 = strMeasure8
//        self.strMeasure9 = strMeasure9
//        self.strMeasure10 = strMeasure10
//        self.strMeasure11 = strMeasure11
//        self.strMeasure12 = strMeasure12
//        self.strMeasure13 = strMeasure13
//        self.strMeasure14 = strMeasure14
//        self.strMeasure15 = strMeasure15
//        self.strImageSource = drink.strImageSource
//        self.strImageAttribution = drink.strImageAttribution
//        self.strCreativeCommonsConfirmed = drink.strCreativeCommonsConfirmed
        self.dateModified = drink.dateModified
        self.isFavorite = false
    }

    mutating func toggleFavorite() {
        isFavorite.toggle()
    }
}

func == (lhs: DrinkModel, rhs: DrinkModel) -> Bool {
    return lhs.id == rhs.id && lhs.title == rhs.title
}
