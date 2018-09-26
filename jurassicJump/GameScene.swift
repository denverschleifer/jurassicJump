//
//  GameScene.swift
//  jurassicJump
//
//  Created by Denver Schleifer on 9/20/18.
//  Copyright © 2018 CVTC. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion
import AVFoundation

class GameScene: SKScene {
    
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode = SKLabelNode(fontNamed: "AvenirNext-Bold")
    var score = 0
    var gravity = -2
    var AudioPlayer = AVAudioPlayer()

    
    
    
    override func didMove(to view: SKView) {
        setupPhysics()
        layoutScene()
        
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "jurassicPark", ofType: "mp3")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
        
        //startGame()
        
    }
    
    
    
    func setupPhysics() {
       // physicsWorld.gravity = CGVector(dx: 0.0, dy: gravity)
        //physicsWorld.contactDelegate = self
        
    }
    
    func layoutScene() {
        
        createPlayer()
        
        scoreLabel.text = "Score: \(score)"
        scoreLabel.fontSize = 35.0
        scoreLabel.fontColor = UIColor.black
        scoreLabel.position = CGPoint(x: 5.0, y: 625.0)
        
        addChild(scoreLabel)
        
    }
    
    func createPlayer() {
        
        let texture = SKTexture(imageNamed: "dino")
        player = SKSpriteNode(texture: texture)
        player.scale(to: CGSize(width: 230, height: 180))
        player.position = CGPoint(x: -100, y: -300)
        player.zPosition = 2
        
        player.physicsBody = SKPhysicsBody(texture: texture, size: player.size)
        player.physicsBody?.isDynamic = true
        player.physicsBody?.affectedByGravity = false
        
        addChild(player)
        
    }
    
    }

