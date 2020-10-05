//
//  Images.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-05.
//
// https:/ /stackoverflow.com/questions/31314412/how-to-resize-image-in-swift
import Foundation
import UIKit

struct Images {
    
    let ScaleWidth: Double
    let ScaleHeight: Double
    /*
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
            // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width /  self.ScaleWidth
        let heightRatio = targetSize.height / self.ScaleHeight
            
            let scaleFactor = min(widthRatio, heightRatio)
            
            // Compute the new image size that preserves aspect ratio
            let scaledImageSize = CGSize(
                width: self.ScaleWidth * scaleFactor,
                height: ScaleHeight * scaleFactor
            )

            // Draw and return the resized UIImage
            let renderer = UIGraphicsImageRenderer(
                size: scaledImageSize
            )

            let scaledImage = renderer.image { _ in
                self.draw(in: CGRect(
                    origin: .zero,
                    size: scaledImageSize
                ))
            }
            return scaledImage
        }
 */
}
