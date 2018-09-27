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
    var enemy: SKSpriteNode!
    var enemy2: SKSpriteNode!
    var enemy3: SKSpriteNode!
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
    
    func startNewGame() {
        
        score = 0
        startNewRound()
        
    }
    
    func startNewRound() {
        
        updateLabels()
        
    }
    
    func updateLabels() {
        
        scoreLabel.text = String(score)
        
    }
    
    
    
    func setupPhysics() {
       // physicsWorld.gravity = CGVector(dx: 0.0, dy: gravity)
        //physicsWorld.contactDelegate = self
        
    }
    
    func layoutScene() {
        
        createPlayer()
        createEnemy()
        createEnemy2()
        createEnemy3()
        
        
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
    
    func createEnemy() {
        
        let texture = SKTexture(imageNamed: "enemy")
        enemy = SKSpriteNode(texture: texture)
        enemy.scale(to: CGSize(width: 130, height: 80))
        enemy.position = CGPoint(x: 100, y: 300)
        enemy.zPosition = 2
        
        enemy.physicsBody = SKPhysicsBody(texture: texture, size: enemy.size)
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.affectedByGravity = false
        
        addChild(enemy)
        
    }
    
    func createEnemy2() {
        
        let texture = SKTexture(imageNamed: "enemy2")
        enemy2 = SKSpriteNode(texture: texture)
        enemy2.scale(to: CGSize(width: 130, height: 80))
        enemy2.position = CGPoint(x: 200, y: -300)
        enemy2.zPosition = 2
        
        enemy2.physicsBody = SKPhysicsBody(texture: texture, size: enemy2.size)
        enemy2.physicsBody?.isDynamic = true
        enemy2.physicsBody?.affectedByGravity = false
        
        addChild(enemy2)
        
    }
    
    func createEnemy3() {
        
        let texture = SKTexture(imageNamed: "enemy3")
        enemy3 = SKSpriteNode(texture: texture)
        enemy3.scale(to: CGSize(width: 130, height: 80))
        enemy3.position = CGPoint(x: -200, y: 200)
        enemy3.zPosition = 2
        
        enemy3.physicsBody = SKPhysicsBody(texture: texture, size: enemy3.size)
        enemy3.physicsBody?.isDynamic = true
        enemy3.physicsBody?.affectedByGravity = false
        
        addChild(enemy3)
        
    }
    
    }

