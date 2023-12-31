//
//  ARModel.swift
//  ARPlayground
//
//  Created by Eric May on 9/13/23.
//

import Foundation
import RealityKit
import ARKit

struct ARModel {
    private(set) var arView : ARView
    
    var imageRecognizedVar = false
    
    init() {
        arView = ARView(frame: .zero)
        
        guard let trackerImage = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }

        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = trackerImage
        arView.session.run(configuration)
    }
    
    mutating func imageRecognized(anchors: [ARAnchor]) {
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else { return }
            imageRecognizedVar = true
        }
    }
}
