//
//  timerCategories.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/22/22.
//

import Foundation

enum categoryName: CaseIterable {
    case vocational, avocational, play, financial, rest, reset, spiritual, intelectual, income
    case family, friends, social, creative, relational, physical, mental, emotional, parental
    case romantic
}

struct Categories: Identifiable, Hashable, Comparable {
    static func < (lhs: Categories, rhs: Categories) -> Bool {
        return lhs.catName < rhs.catName
    }
    
    var id: UUID
    var catName: String
    
    /* Later I will add: icon/image, description */
}

func arrayOfCategories() -> [Categories] {
    var catList: [Categories] = []
    
    for cat in categoryName.allCases {
        catList.append(Categories(id: UUID(), catName: "\(cat)"))
    }

    return catList.sorted()
}
