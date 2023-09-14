//
//  ARViewModel.swift
//  ARPlayground
//
//  Created by Eric May on 9/13/23.
//

import Foundation
import RealityKit
import ARKit

class ARViewModel: UIViewController, ObservableObject,  ARSessionDelegate {
    @Published private var model : ARModel = ARModel()
    
    var arView : ARView {
        model.arView
    }
    
    var imageRecognizedVar : Bool {
        model.imageRecognizedVar
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        model.imageRecognized(anchors: anchors)
    }
    
}
