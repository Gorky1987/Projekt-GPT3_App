//
//  SwiftUIView.swift
//  Abschlussprojekt_ SwiftUI_Synthax
//
//  Created by WorkingAccount on 19.02.23.
//

import Foundation
import CoreData

@objc(Photo)
public class Photo: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }
    
    @NSManaged public var imageData: Data
    @NSManaged public var name: String
    @NSManaged public var date: Date
    @NSManaged public var photoDescription: String
}
