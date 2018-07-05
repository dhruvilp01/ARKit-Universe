//
//  ViewController.swift
//  UniversePlanetRotate
//
//  Created by Dhruvil Patel on 6/28/18.
//  Copyright © 2018 Dhruvil. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let sun = SCNNode(geometry: SCNSphere(radius: 0.35))
        let eartParent = SCNNode()
        let venusParent = SCNNode()
        let moonParent = SCNNode()
        let mercuryParent = SCNNode()
        let marsParent = SCNNode()
        let jupiterParent = SCNNode()
        let saturnParent = SCNNode()
        let uranusParent = SCNNode()
        let neptuneParent = SCNNode()
        let saturnRingParent = SCNNode()
        
        
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun diffuse")
        sun.position = SCNVector3(0,0,-1)
        eartParent.position = SCNVector3(0,0,-1)
        moonParent.position = SCNVector3(1.2,0,0)
        venusParent.position = SCNVector3(0,0,-1)
        mercuryParent.position = SCNVector3(0,0,-1)
        marsParent.position = SCNVector3(0,0,-1)
        jupiterParent.position = SCNVector3(0,0,-1)
        saturnParent.position = SCNVector3(0,0,-1)
        uranusParent.position = SCNVector3(0,0,-1)
        neptuneParent.position = SCNVector3(0,0,-1)
        saturnRingParent.position = SCNVector3(2.1,0,0)
        
        
        self.sceneView.scene.rootNode.addChildNode(sun)
        self.sceneView.scene.rootNode.addChildNode(eartParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        self.sceneView.scene.rootNode.addChildNode(mercuryParent)
        self.sceneView.scene.rootNode.addChildNode(marsParent)
        self.sceneView.scene.rootNode.addChildNode(jupiterParent)
        self.sceneView.scene.rootNode.addChildNode(saturnParent)
        self.sceneView.scene.rootNode.addChildNode(uranusParent)
        self.sceneView.scene.rootNode.addChildNode(neptuneParent)
        
        
        
        let earth = planet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Earth day"), specular: #imageLiteral(resourceName: "Earth Specular"), emission: #imageLiteral(resourceName: "Earth Emission"), normal: #imageLiteral(resourceName: "Earth Normal"), position: SCNVector3(1.2 ,0 , 0))
        let venus = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Venus Surface"), specular: nil, emission: #imageLiteral(resourceName: "Venus Atmospher"), normal: nil, position: SCNVector3(0.7, 0, 0))
        let moon = planet(geometry: SCNSphere(radius: 0.05), diffuse: #imageLiteral(resourceName: "Moon Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0,0,-0.3))
        let mercury = planet(geometry: SCNSphere(radius: 0.07), diffuse: #imageLiteral(resourceName: "Mercury diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.5, 0, 0))
        let mars = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Mars diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1.5, 0, 0))
        let jupiter = planet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Jupiter diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1.8,0,0))
        let saturn = planet(geometry: SCNSphere(radius: 0.4), diffuse: #imageLiteral(resourceName: "Saturn diffuse") , specular: nil, emission: nil, normal: nil, position: SCNVector3(2.1,0,0))
        let uranus = planet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Uranus diffuse") , specular: nil, emission: nil, normal: nil, position: SCNVector3(2.5,0,0))
        let neptune = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Neptune diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.8,0,0))
        let saturnRing = planet(geometry: SCNTorus(ringRadius: 0.6, pipeRadius: 0.01), diffuse: #imageLiteral(resourceName: "Saturn Ring Diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0,0,-0.2))



        let sunAction = Rotation(time: 8)
        let earthParentRotation = Rotation(time: 14)
        let earthRotation = Rotation(time: 8)
        let moonRotation = Rotation(time: 3)
        let venusRotation = Rotation(time: 8)
        let veunsParentRotation = Rotation(time: 10)
        let mercuryRoation = Rotation(time: 5)
        let mercuryParentRotation = Rotation(time: 8)
        let marsRotation = Rotation(time: 8)
        let marsParentRotation = Rotation(time: 9)
        let jupiterRotation = Rotation(time: 5)
        let jupiterParentRotation = Rotation(time: 8)
        let saturnRotation = Rotation(time: 5)
        let saturnParentRotation  = Rotation(time: 6)
        let uranusRotation = Rotation(time: 9)
        let uranusParentRotation = Rotation(time: 11)
        let neptuneRotation = Rotation(time: 10)
        let neptuenParentRotation = Rotation(time: 12)
        let satunrRingRotation = Rotation(time: 3)
        
     
    
        earth.runAction(earthRotation)
        eartParent.runAction(earthParentRotation)
        moonParent.runAction(moonRotation)
        venus.runAction(venusRotation)
        venusParent.runAction(veunsParentRotation)
        mercury.runAction(mercuryRoation)
        mercuryParent.runAction(mercuryParentRotation)
        marsParent.runAction(marsParentRotation)
        mars.runAction(marsRotation)
        jupiterParent.runAction(jupiterParentRotation)
        jupiter.runAction(jupiterRotation)
        saturnParent.runAction(saturnParentRotation)
        saturn.runAction(saturnRotation)
        uranus.runAction(uranusRotation)
        uranusParent.runAction(uranusParentRotation)
        neptune.runAction(neptuneRotation)
        neptuneParent.runAction(neptuenParentRotation)
        saturnRingParent.runAction(satunrRingRotation)
        
        
        sun.runAction(sunAction)
        eartParent.addChildNode(earth)
        earth.addChildNode(moon)
        eartParent.addChildNode(moonParent)
        moonParent.addChildNode(moon)
        saturnParent.addChildNode(saturn)
        saturn.addChildNode(saturnRing)
        saturnParent.addChildNode(saturnRingParent)
        saturnRingParent.addChildNode(saturnRing)
        mercuryParent.addChildNode(mercury)
        venusParent.addChildNode(venus)
        marsParent.addChildNode(mars)
        jupiterParent.addChildNode(jupiter)
        uranusParent.addChildNode(uranus)
        neptuneParent.addChildNode(neptune)
       
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
        
    }
    
    func Rotation(time: TimeInterval) -> SCNAction {
        let Rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: time)
        let foreverRotation = SCNAction.repeatForever(Rotation)
        return foreverRotation
    }

}
extension Int {
    
    var degreesToRadians: Double { return Double(self) * .pi/180}
}

