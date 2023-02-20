//
//  PhotoAlbumView.swift
//  Projekt_SwiftUI
//
//  Created by WorkingAccount on 18.02.23.
//

import SwiftUI


import Foundation
import CoreData
import SwiftUI

class PhotoAlbumViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    @Published var selectedPhoto: Photo? = nil
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        loadPhotos()
    }

    func loadPhotos() {
        let fetchRequest = NSFetchRequest<Photo>(entityName: "Photo")
        let sortDescriptor = NSSortDescriptor(keyPath: \Photo.date, ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            photos = try managedObjectContext.fetch(fetchRequest)
        } catch {
            print("Error loading photos: \(error.localizedDescription)")
        }
    }

    func deletePhoto(at index: Int) {
        let photo = photos[index]
        managedObjectContext.delete(photo)
        saveChanges()
    }

    func sharePhoto(at index: Int) {
      //  guard let photo = photos[safe: index], let imageData = photo.imageData else { return }
     //   let avc = UIActivityViewController(activityItems: [imageData], applicationActivities: nil)
     //   UIApplication.shared.windows.first?.rootViewController?.present(avc, animated: true, completion: nil)
    }

    private func saveChanges() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
        loadPhotos()
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

