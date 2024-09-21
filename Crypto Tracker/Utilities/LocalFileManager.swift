//
//  LocalFileManager.swift
//  Crypto Tracker
//
//  Created by Shishir Rijal on 22/09/2024.
//
import Foundation
import SwiftUI

// Singleton class to manage local file operations
class LocalFileManager {
    
    // Singleton instance
    static let instance = LocalFileManager()
    
    // Private initializer to ensure Singleton pattern
    private init() { }
    
    // Function to save an image to a specified folder with a given name
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // Create the folder if it doesn't exist
        createFolder(folderName: folderName)
        
        // Convert UIImage to PNG data and get the URL for saving
        guard
            let data = image.pngData(), // Convert UIImage to PNG data
            let url = getURLForImage(imageName: imageName, folderName: folderName) // Get URL to save the image
        else { return } // Return if conversion fails
        
        // Try to write the image data to the file at the specified URL
        do {
            try data.write(to: url)
            print("Image saved successfully at \(url)")
        } catch let error {
            print("Error saving image: \(error)")
        }
    }
    
    // Function to retrieve an image from a folder with a given name
    func getImage(imageName: String, folderName: String) -> UIImage? {
        // Get the URL for the image and check if the file exists at that URL
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName), // Get URL for the image
            FileManager.default.fileExists(atPath: url.path) // Check if the file exists at the path
        else { return nil } // Return nil if the file doesn't exist
        
        // Return the UIImage if found at the path
        return UIImage(contentsOfFile: url.path)
    }
    
    // Private function to create a folder if it doesn't already exist
    private func createFolder(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return } // Get folder URL
        
        // Check if the folder already exists; if not, create it
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
                print("Folder created successfully at \(url)")
            } catch let error {
                print("Error creating directory! Folder Name: \(folderName). Error Detail: \(error)")
            }
        }
    }
    
    // Private function to get the URL for a specific folder in the Caches directory
    private func getURLForFolder(folderName: String) -> URL? {
        // Get the path to the Caches directory for the user domain
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        // Append the folder name to the Caches directory path
        return url.appendingPathComponent(folderName)
    }
    
    // Private function to get the URL for a specific image in a folder
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        // Get the folder URL first
        guard let folderUrl = getURLForFolder(folderName: folderName) else { return nil }
        // Append the image name with ".png" extension to the folder path
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
}
