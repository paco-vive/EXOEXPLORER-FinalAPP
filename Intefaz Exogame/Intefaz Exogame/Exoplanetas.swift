import SwiftUI
import SceneKit
import Foundation

// MARK: - Description
//The following code is designed to simulate in a certain way the perspective of the space that we would have when we position ourselves from a star, or rather the user would be the star because we have included a horizon that allows the difference between the surface of the star and the sky of the star. This code has not included the exoplanets of the host stars, but it is planned that from the measurement of the semi-major axis of the orbit of the planets that orbit around their stars, we can generate these planets orbiting. In the video I made the mistake of writing brightness instead of luminosity. The parameters of the stars are with respect to the database, but mathematical operations were applied to rescale and give a more aesthetic touch.
// MARK: - IMPORT
import SwiftUI
import SceneKit
import Foundation
// MARK: - Data Structure
struct SphereData: Identifiable {
    var id = UUID()
    var position: SCNVector3
    var transparency: CGFloat
    var name: String
    var radius: Float
}

// MARK: - Extension to Create Lines
extension SCNGeometry {
    static func line(from vectorA: SCNVector3, to vectorB: SCNVector3) -> SCNGeometry {
        let vertices = [vectorA, vectorB]
        let source = SCNGeometrySource(vertices: vertices)
        
        let indices: [Int32] = [0, 1]
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        
        return SCNGeometry(sources: [source], elements: [element])
    }
}

// MARK: - SCNViewRepresentable
struct SCNViewRepresentable: UIViewRepresentable {
    let scene: SCNScene
    @Binding var cameraPosition: SCNVector3
    @Binding var selectedStarInfo: String
    @Binding var selectedStarName: String
    @Binding var isLineDrawingMode: Bool
    @Binding var selectedStarsForLine: [SCNNode]
    @Binding var lines: [SCNNode]
    @Binding var showNametags: Bool
    
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = scene
        scnView.allowsCameraControl = false // Disable default camera controls
        scnView.backgroundColor = UIColor.black
        scnView.autoenablesDefaultLighting = true
        
        // Set the initial camera
        if let cameraNode = scene.rootNode.childNodes.first(where: { $0.camera != nil }) {
            cameraNode.position = cameraPosition
            cameraNode.eulerAngles = SCNVector3Zero
        }
        
        // Add gestures
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePan(_:)))
        scnView.addGestureRecognizer(panGesture)
        
        return scnView
    }
    
    func updateUIView(_ scnView: SCNView, context: Context) {
        // Update camera position
        if let cameraNode = scene.rootNode.childNodes.first(where: { $0.camera != nil }) {
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            cameraNode.position = cameraPosition
            SCNTransaction.commit()
        }
        
        // Add lines to the scene if they are not already added
        for line in lines {
            if line.parent == nil {
                scene.rootNode.addChildNode(line)
            }
        }
        
        // Show or hide nametags by traversing all descendant nodes
        scene.rootNode.enumerateChildNodes { (node, stop) in
            if node.name == "Nametag" {
                node.isHidden = !showNametags
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // MARK: - Coordinator
    class Coordinator: NSObject {
        var parent: SCNViewRepresentable
        var lastPanLocation: CGPoint = .zero
        var yaw: Float = 0.0   // Horizontal rotation
        var pitch: Float = 0.0 // Vertical rotation
        
        init(_ parent: SCNViewRepresentable) {
            self.parent = parent
        }
        
        @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
            let scnView = gestureRecognizer.view as! SCNView
            let location = gestureRecognizer.location(in: scnView)
            let hitResults = scnView.hitTest(location, options: nil)
            
            if let result = hitResults.first {
                let selectedNode = result.node
                
                if parent.isLineDrawingMode {
                    // Line drawing mode
                    if selectedNode.geometry is SCNSphere {
                        if !parent.selectedStarsForLine.contains(selectedNode) {
                            parent.selectedStarsForLine.append(selectedNode)
                            
                            if parent.selectedStarsForLine.count == 2 {
                                // Create a line between the two selected stars
                                let start = parent.selectedStarsForLine[0].position
                                let end = parent.selectedStarsForLine[1].position
                                let lineNode = createLineNode(from: start, to: end)
                                parent.lines.append(lineNode)
                                
                                // Clear selections
                                parent.selectedStarsForLine.removeAll()
                                // Add the line to the scene
                                scnView.scene?.rootNode.addChildNode(lineNode)
                            }
                        }
                    }
                } else {
                 
                    // Star selection mode
                    if let cameraNode = scnView.scene?.rootNode.childNodes.first(where: { $0.camera != nil }) {
                        SCNTransaction.begin()
                        SCNTransaction.animationDuration = 1.0
                        
                        let selectedPosition = selectedNode.position
                        // Update the camera position to the selected star position
                        parent.cameraPosition = selectedPosition
                        
                        // Reset rotations
                        yaw = 0.0
                        pitch = 0.0
                        cameraNode.eulerAngles = SCNVector3Zero
                        
                        // Update information of the selected star
                        if let material = (selectedNode.geometry as? SCNSphere)?.materials.first,
                           let _ = material.diffuse.contents as? UIColor {
                            let brightness = material.transparency
                            let starName = selectedNode.name ?? "Unknown"
                            parent.selectedStarInfo = "Coordinates: (x: \(selectedNode.position.x), y: \(selectedNode.position.y), z: \(selectedNode.position.z))\nLuminosity: \(brightness)"
                            parent.selectedStarName = "Estás en la estrella: \(starName)"
                        }
                        
                        SCNTransaction.commit()
                    }
                }
            }
        }
        
        @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
            let translation = gestureRecognizer.translation(in: gestureRecognizer.view)
            let sensitivity: Float = 0.005
            
            // Update yaw and pitch based on motion
            yaw -= Float(translation.x) * sensitivity
            pitch -= Float(translation.y) * sensitivity
            
            // Limit pitch to avoid full turns
            let pitchLimit: Float = Float.pi / 2 - 0.1
            if pitch > pitchLimit {
                pitch = pitchLimit
            }
            if pitch < -pitchLimit {
                pitch = -pitchLimit
            }
            
            // Apply rotations to the camera
            if let cameraNode = parent.scene.rootNode.childNodes.first(where: { $0.camera != nil }) {
                cameraNode.eulerAngles = SCNVector3(pitch, yaw, 0)
            }
            
            // Reset the translation of the gesture
            gestureRecognizer.setTranslation(.zero, in: gestureRecognizer.view)
        }
        
        func createLineNode(from: SCNVector3, to: SCNVector3) -> SCNNode {
            let line = SCNGeometry.line(from: from, to: to)
            let lineNode = SCNNode(geometry: line)
            lineNode.geometry?.firstMaterial?.diffuse.contents = UIColor(
                red: CGFloat.random(in: 0...1),
                green: CGFloat.random(in: 0...1),
                blue: CGFloat.random(in: 0...1),
                alpha: 1.0
            )
            lineNode.geometry?.firstMaterial?.lightingModel = .constant
            return lineNode
        }
    }
}

// MARK: - ContentView
struct esferasView: View {
    @State private var spheres: [SphereData] = []
    @State private var showNametags: Bool = true
    
    @State private var cameraPosition = SCNVector3(x: 0, y: 0, z: 0)
    @State private var selectedStarInfo = "Coordinates: (x: 0, y: 0, z: 0)\nLuminosity[logSol]: 0.0"
    @State private var selectedStarName = "You are the star: Unknow"
    @State private var isLineDrawingMode = false
    @State private var selectedStarsForLine: [SCNNode] = []
    @State private var lines: [SCNNode] = []
    
    @State private var scene = SCNScene()
    
    var body: some View {
        ZStack {
            SCNViewRepresentable(
                scene: scene,
                cameraPosition: $cameraPosition,
                selectedStarInfo: $selectedStarInfo,
                selectedStarName: $selectedStarName,
                isLineDrawingMode: $isLineDrawingMode,
                selectedStarsForLine: $selectedStarsForLine,
                lines: $lines,
                showNametags: $showNametags
            )
            .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    
                    Button(action: {
                        showNametags.toggle()
                    }) {
                        Text(showNametags ? "Hide Nametags" : "Show Nametags")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding([.top, .leading])
                    
                    Spacer()
                    
             
                    VStack(alignment: .leading) {
                        Text(selectedStarName)
                            .padding(5)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .font(.caption)
                            .foregroundColor(.black)
                        
                        Text(selectedStarInfo)
                            .padding(5)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    .padding([.top, .trailing])
                }
                
                Spacer()
                
                HStack {
                    // Button for activating/deactivating the line drawing mode
                    Button(action: {
                        isLineDrawingMode.toggle()
                    }) {
                        Text(isLineDrawingMode ? "Deactivate Tracing" : "Activate Tracing")
                            .padding()
                            .background(isLineDrawingMode ? Color.red : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Button for deleting lines
                    Button(action: {
                        // Delete all lines
                        lines.forEach { $0.removeFromParentNode() }
                        lines.removeAll()
                    }) {
                        Text("Delete lines")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                .padding(.bottom)
            }
        }
        .onAppear {
            loadCSVData()
            setupScene()
        }
    }
    
    // MARK: - CSV Data Loading
    func loadCSVData() {
        guard let url = Bundle.main.url(forResource: "datos2", withExtension: "csv") else {
            print("No se pudo encontrar el archivo CSV.")
            return
        }
        
        do {
            let data = try String(contentsOf: url)
            let rows = data.components(separatedBy: .newlines)
            var loadedSpheres: [SphereData] = []
            for row in rows.dropFirst() { // Assuming that the first row is headed
                let columns = row.components(separatedBy: ",")
                if columns.count == 6 {
                    if let radius0 = Float(columns[1]),
                       let ra0 = Float(columns[2]), // Grades
                       let dec0 = Float(columns[3]), // Grades
                       let transparencyValue = Double(columns[4]),
                       let tamaño1 = Float(columns[5]),
                       transparencyValue >= -4, transparencyValue <= 4.0 // Transparency range
                    {
                        let tamaño = tamaño1 / 10
                        let name = columns[0]
                        
                        let ra = ra0 * Float.pi / 180
                        let dec = (90 - dec0) * Float.pi / 180
                        let radius = radius0
                      
                        // From Spherics coordinates to cartesian coordinates
                        let x = radius * sin(ra) * cos(dec)
                        let y = radius * sin(ra) * sin(dec)
                        let z = radius * cos(ra)
                        
                        let sphereData = SphereData(
                            position: SCNVector3(x, y, z),
                            transparency: CGFloat(transparencyValue),
                            name: name,
                            radius: tamaño
                        )
                        loadedSpheres.append(sphereData)
                    }
                }
            }
            self.spheres = loadedSpheres
        } catch {
            print("Error al leer el archivo CSV: \(error)")
        }
    }
    
    // MARK: - Scene Configuration
    func setupScene() {
        scene.background.contents = UIColor.black
        
        // Create the container node
        let containerNode = SCNNode()
        containerNode.name = "containerNode"
        scene.rootNode.addChildNode(containerNode)
        
        // Add lights
        addLights(to: scene)
        
        // Add spheres and nametags
        for sphereData in spheres {
            // Create sphere
            let sphere = SCNSphere(radius: CGFloat(sphereData.radius))
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.white
            material.transparency = sphereData.transparency
            material.blendMode = .alpha
            sphere.materials = [material]
            
            let sphereNode = SCNNode(geometry: sphere)
            sphereNode.position = sphereData.position
            sphereNode.name = sphereData.name
            containerNode.addChildNode(sphereNode)
            
            // Create nametag
            let textGeometry = SCNText(string: sphereData.name, extrusionDepth: 0.1)
            textGeometry.font = UIFont.systemFont(ofSize: 10)
            textGeometry.flatness = 0.1
            textGeometry.firstMaterial?.diffuse.contents = UIColor.white
            
            let textNode = SCNNode(geometry: textGeometry)
            textNode.scale = SCNVector3(0.02, 0.02, 0.02)
            textNode.position = SCNVector3(
                sphereData.position.x,
                sphereData.position.y + Float(sphereData.radius) + 0.5,
                sphereData.position.z
            )
            textNode.name = "Nametag"
            
            // Add constraint
            let billboardConstraint = SCNBillboardConstraint()
            billboardConstraint.freeAxes = .all
            textNode.constraints = [billboardConstraint]
            
            containerNode.addChildNode(textNode)
        }
        
        // Create the camera and stablish a initial position
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = cameraPosition // Inicialmente en (0,0,0)
        cameraNode.eulerAngles = SCNVector3Zero
        scene.rootNode.addChildNode(cameraNode)
    }
    
    // MARK: - Add lights to the scene
    func addLights(to scene: SCNScene) {
        // Directional light
        let directionalLightNode = SCNNode()
        directionalLightNode.light = SCNLight()
        directionalLightNode.light?.type = .directional
        directionalLightNode.light?.castsShadow = false
        directionalLightNode.eulerAngles = SCNVector3(-Float.pi / 3, 0, 0) // Adjust direction
        scene.rootNode.addChildNode(directionalLightNode)
        
        // Ambient Light
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.intensity = 300
        ambientLightNode.light?.color = UIColor(white: 0.8, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
    }
}

// MARK: - Vista Previa para ContentView
struct CPreviews: PreviewProvider {
    static var previews: some View {
        esferasView()
    }
}
