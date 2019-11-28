//
//  ContentView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 19/11/2019.
//  Copyright © 2019 Milo Hill. All rights reserved.
//

import SwiftUI
import Combine
import SpriteKit

struct BaubleView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("BaublesGreen")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

func createLightingScene() -> SKScene {
    let tree = NSImage(named: "Tree")!
    let image = NSImage(named: "LightsA")!
    let scene = SKScene(size: image.size)
    let texture = SKTexture(image: image)
    let treeTexture = SKTexture(image: tree)
    let treeNode = SKSpriteNode(texture: treeTexture)
    let node = SKSpriteNode(texture: texture)

    scene.addChild(node)
    scene.addChild(treeNode)
    node.size = scene.size
    scene.shouldRasterize = true
    node.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
    treeNode.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
    scene.scaleMode = .aspectFit
    scene.backgroundColor = .clear

    let fadeOut = SKAction.fadeAlpha(to: 0.1, duration: 1)
    let fadeIn = SKAction.fadeAlpha(to: 1, duration: 2)
    let wait = SKAction.wait(forDuration: 1)

    node.run(SKAction.repeatForever(SKAction.sequence([fadeIn, fadeOut, wait])))

    return scene
}

struct SceneView: NSViewRepresentable {
    let scene: SKScene

    func makeNSView(context: NSViewRepresentableContext<SceneView>) -> SKView {
        // Let SwiftUI handle the sizing
        let view = SKView(frame: .zero)
        view.showsFPS = true
        view.showsNodeCount = true
        view.allowsTransparency = true
        return view
    }

    func updateNSView(_ nsView: SKView, context: NSViewRepresentableContext<SceneView>) {
        nsView.presentScene(scene)
    }
}

struct LightsView: View {
    @State var lightOpacityA: Double = 0
    @State var lightOpacityB: Double = 1

    var animation = Animation.easeIn(duration: 1).delay(4).repeatForever()
    var body: some View {
        ZStack(alignment: .center) {
//            SceneView(scene: createLightingScene())
            Image("LightsA")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(lightOpacityA)

            Image("LightsB")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(lightOpacityB)
        }
        .onAppear(perform: {
            withAnimation(self.animation) {
                self.lightOpacityA = 1
                self.lightOpacityB = 0
            }
        })
    }
}

struct ContentView: View {
    var size = NSImage(named: "Tree")!.size
    var body: some View {
        HStack(alignment: .bottom) {
            ZStack(alignment: .center) {
                Image("Tree")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .minimumScaleFactor(1)

                LightsView().aspectRatio(size, contentMode: .fit)
                BaubleView()
                Image("Star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .minimumScaleFactor(1)
            }
            CountdownView().offset(x: -10, y: 0)
        }
        .frame(minWidth: 200, minHeight: 200)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
