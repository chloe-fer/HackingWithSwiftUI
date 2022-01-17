//
//  Movie+CoreDataProperties.swift
//  Project12-CoreData
//
//  Created by Chloe Fermanis on 17/1/2022.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var wrappedDirextor: String {
        director ?? "Unknown Director"
    }

}

extension Movie : Identifiable {

}
