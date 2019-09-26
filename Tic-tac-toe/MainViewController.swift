//
//  MainViewController.swift
//  Tic-tac-toe
//
//  Created by Aleksandr Tsebrii on 9/8/19.
//  Copyright © 2019 Aleksandr Tsebrii. All rights reserved.
//

import UIKit

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    private let xButton: UIButton = {
        let button = UIButton()
        button.setTitle("select", for: .normal)
        button.setImage(UIImage(named: "cross"), for: .normal)
        button.tintColor = UIColor.Design.tangerine
        button.addTarget(self, action: #selector(xButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let oButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "nought"), for: .normal)
        button.tintColor = UIColor.Design.dafodil
        button.addTarget(self, action: #selector(oButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let player1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.tintColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let player2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shell")
        imageView.tintColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Switch for multi-player or single player
    private let multiPlayerSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = true
        switcher.onTintColor = UIColor.black.withAlphaComponent(0.7)
        switcher.tintColor = UIColor.black.withAlphaComponent(0.7)
        return switcher
    }()
    
    private let button0: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 0
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 1
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 2
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button3: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 3
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button4: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 4
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button5: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 5
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button6: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 6
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button7: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 7
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let button8: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.tintColor = UIColor.white
        button.tag = 8
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let player1ScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.text = "score: 0"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let player2ScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.text = "score: 0"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let winnerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Who is the winner?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Game history
    private let historyTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.white
        textView.textAlignment = .center
        textView.font = UIFont.init(name: Constant.Font.Name.regular,
                                    size: Constant.Font.Size.regular)
        textView.isEditable = false
        textView.isSelectable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        let string = "Reset game"
        let font = UIFont.init(name: Constant.Font.Name.medium,
                               size: Constant.Font.Size.medium)
        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.foregroundColor: UIColor.white]
        let attributedString = NSAttributedString(string: string,
                                                  attributes: attributes as [NSAttributedString.Key : Any])
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(resetButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "play"), for: .normal)
        button.addTarget(self, action: #selector(playButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private let pauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pause"), for: .normal)
        button.addTarget(self, action: #selector(pauseButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private let stopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "stop"), for: .normal)
        button.addTarget(self, action: #selector(stopButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private let settingsView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.alpha = 0
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Properties
    
    let imagePicker = UIImagePickerController()
    
    var soundPlayer: AVAudioPlayer?
    var elapsedTime: TimeInterval = 0
    
    // Declaring symbols for the game
    var crossImage = UIImage(named: "cross")
    var noughtImage = UIImage(named: "nought")
    
    lazy var cellButtons: [UIButton] = {
        return [button0, button1, button2,
                button3, button4, button5,
                button6, button7, button8]
    }()
    
    // Default 9 buttons of the grid
    var grid = [[0, 0, 0],
                [0, 0, 0],
                [0, 0, 0]]
    
    var currentPlayer : Int = 1
    
    // Current score
    var player1Score : Int = 0
    var player2Score : Int = 0
    
    var isSettings = false
    
    // MARK: - Lifecycle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        super.loadView()
        
        // Background view
        
        view.backgroundColor = UIColor.Design.blueberry
        
        // Bar button items
        
        let settingsBarButton = UIBarButtonItem(image: (UIImage(named: "settings")), style: .plain, target: self, action: #selector(settingsBarButtonTapped(_:)))
        navigationItem.leftBarButtonItem = settingsBarButton
        
        let resetBarButton = UIBarButtonItem(title: "Reset game", style: .plain, target: self, action: #selector(resetBarButtonTapped(_:)))
        navigationItem.rightBarButtonItem = resetBarButton
        
        // Top label
        
        let topLabel = UILabel()
        topLabel.text = "Score"
        topLabel.font = UIFont.init(name: Constant.Font.Name.medium,
                                    size: Constant.Font.Size.medium)
        topLabel.textAlignment = .center
        topLabel.textColor = UIColor.white
        topLabel.backgroundColor = UIColor.Design.darkNavy
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let underTopLabel = UILabel()
        underTopLabel.text = "*If necessary, select figure"
        underTopLabel.font = UIFont.init(name: Constant.Font.Name.regular,
                                         size: 12)
        underTopLabel.textAlignment = .center
        underTopLabel.textColor = UIColor.white
        underTopLabel.backgroundColor = UIColor.Design.darkNavy
        underTopLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topLabel)
        view.addSubview(underTopLabel)
        
        NSLayoutConstraint.activate([
            topLabel.heightAnchor.constraint(equalToConstant: 32),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            underTopLabel.heightAnchor.constraint(equalToConstant: 16),
            underTopLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            underTopLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            underTopLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        // Player 1 stack view
        
        let player1StackView = UIStackView(arrangedSubviews: [xButton, /*player1ImageView, */player1ScoreLabel])
        player1StackView.axis = .vertical
        player1StackView.alignment = .center
        player1StackView.distribution = .equalSpacing
        player1StackView.spacing = 8
        player1StackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(player1StackView)
        
        NSLayoutConstraint.activate([
            xButton.heightAnchor.constraint(equalToConstant: 64),
            xButton.widthAnchor.constraint(equalToConstant: 64)
            ])
        
//        NSLayoutConstraint.activate([
//            player1ImageView.heightAnchor.constraint(equalToConstant: 64),
//            player1ImageView.widthAnchor.constraint(equalToConstant: 64)
//            ])
        
        NSLayoutConstraint.activate([
            player1StackView.topAnchor.constraint(equalTo: underTopLabel.bottomAnchor, constant: 16),
            player1StackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 64)
            ])
        
        // Player 2 stack view
        
        let player2StackView = UIStackView(arrangedSubviews: [oButton, /*player2ImageView, */player2ScoreLabel])
        player2StackView.axis = .vertical
        player2StackView.alignment = .center
        player2StackView.distribution = .equalSpacing
        player2StackView.spacing = 8
        player2StackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(player2StackView)
        
        NSLayoutConstraint.activate([
            oButton.heightAnchor.constraint(equalToConstant: 64),
            oButton.widthAnchor.constraint(equalToConstant: 64)
            ])
        
//        NSLayoutConstraint.activate([
//            player2ImageView.heightAnchor.constraint(equalToConstant: 64),
//            player2ImageView.widthAnchor.constraint(equalToConstant: 64)
//            ])
        
        NSLayoutConstraint.activate([
            player2StackView.topAnchor.constraint(equalTo: player1StackView.topAnchor),
            player2StackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -64)
            ])
        
        // Grid
        
        let gridWidth = view.bounds.width - (16 * 2)
        
        let gridView = UIView()
        gridView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        gridView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gridView)
        
        NSLayoutConstraint.activate([
            gridView.widthAnchor.constraint(equalToConstant: gridWidth),
            gridView.heightAnchor.constraint(equalToConstant: gridWidth),
            gridView.topAnchor.constraint(equalTo: player1StackView.bottomAnchor, constant: 16),
            gridView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ])
        
        gridView.addSubview(button0)
        gridView.addSubview(button1)
        gridView.addSubview(button2)
        gridView.addSubview(button3)
        gridView.addSubview(button4)
        gridView.addSubview(button5)
        gridView.addSubview(button6)
        gridView.addSubview(button7)
        gridView.addSubview(button8)
        
        // Cells
        
        let cellWidth = (gridWidth / 3) - (2 * 2)
        
        NSLayoutConstraint.activate([
            button0.widthAnchor.constraint(equalToConstant: cellWidth),
            button0.heightAnchor.constraint(equalToConstant: cellWidth),
            button0.leadingAnchor.constraint(equalTo: gridView.leadingAnchor),
            button0.topAnchor.constraint(equalTo: gridView.topAnchor),
            
            button1.widthAnchor.constraint(equalToConstant: cellWidth),
            button1.heightAnchor.constraint(equalToConstant: cellWidth),
            button1.centerXAnchor.constraint(equalTo: gridView.centerXAnchor),
            button1.topAnchor.constraint(equalTo: gridView.topAnchor),
            
            button2.widthAnchor.constraint(equalToConstant: cellWidth),
            button2.heightAnchor.constraint(equalToConstant: cellWidth),
            button2.trailingAnchor.constraint(equalTo: gridView.trailingAnchor),
            button2.topAnchor.constraint(equalTo: gridView.topAnchor),
            
            button3.widthAnchor.constraint(equalToConstant: cellWidth),
            button3.heightAnchor.constraint(equalToConstant: cellWidth),
            button3.leadingAnchor.constraint(equalTo: gridView.leadingAnchor),
            button3.centerYAnchor.constraint(equalTo: gridView.centerYAnchor),
            
            button4.widthAnchor.constraint(equalToConstant: cellWidth),
            button4.heightAnchor.constraint(equalToConstant: cellWidth),
            button4.centerXAnchor.constraint(equalTo: gridView.centerXAnchor),
            button4.centerYAnchor.constraint(equalTo: gridView.centerYAnchor),
            
            button5.widthAnchor.constraint(equalToConstant: cellWidth),
            button5.heightAnchor.constraint(equalToConstant: cellWidth),
            button5.trailingAnchor.constraint(equalTo: gridView.trailingAnchor),
            button5.centerYAnchor.constraint(equalTo: gridView.centerYAnchor),
            
            button6.widthAnchor.constraint(equalToConstant: cellWidth),
            button6.heightAnchor.constraint(equalToConstant: cellWidth),
            button6.leadingAnchor.constraint(equalTo: gridView.leadingAnchor),
            button6.bottomAnchor.constraint(equalTo: gridView.bottomAnchor),
            
            button7.widthAnchor.constraint(equalToConstant: cellWidth),
            button7.heightAnchor.constraint(equalToConstant: cellWidth),
            button7.centerXAnchor.constraint(equalTo: gridView.centerXAnchor),
            button7.bottomAnchor.constraint(equalTo: gridView.bottomAnchor),
            
            button8.widthAnchor.constraint(equalToConstant: cellWidth),
            button8.heightAnchor.constraint(equalToConstant: cellWidth),
            button8.trailingAnchor.constraint(equalTo: gridView.trailingAnchor),
            button8.bottomAnchor.constraint(equalTo: gridView.bottomAnchor)
            ])
        
        // History label
        
        let historyLabel = UILabel()
        historyLabel.text = "History"
        historyLabel.font = UIFont.init(name: Constant.Font.Name.medium,
                                        size: Constant.Font.Size.medium)
        historyLabel.textAlignment = .center
        historyLabel.textColor = UIColor.white
        historyLabel.backgroundColor = UIColor.Design.darkNavy
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let underHistoryLabel = UILabel()
        underHistoryLabel.text = "*Below the history of past games"
        underHistoryLabel.font = UIFont.init(name: Constant.Font.Name.regular,
                                             size: 12)
        underHistoryLabel.textAlignment = .center
        underHistoryLabel.textColor = UIColor.white
        underHistoryLabel.backgroundColor = UIColor.Design.darkNavy
        underHistoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(historyLabel)
        view.addSubview(underHistoryLabel)
        
        NSLayoutConstraint.activate([
            historyLabel.heightAnchor.constraint(equalToConstant: 32),
            historyLabel.topAnchor.constraint(equalTo: gridView.bottomAnchor, constant: 16),
            historyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            historyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            underHistoryLabel.heightAnchor.constraint(equalToConstant: 16),
            underHistoryLabel.topAnchor.constraint(equalTo: historyLabel.bottomAnchor),
            underHistoryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            underHistoryLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        // History text view
        
        view.addSubview(historyTextView)
        
        NSLayoutConstraint.activate([
            historyTextView.topAnchor.constraint(equalTo: underHistoryLabel.bottomAnchor),
            historyTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            historyTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            historyTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        // Settings view
        
        view.addSubview(settingsView)
        
        NSLayoutConstraint.activate([
            settingsView.heightAnchor.constraint(equalToConstant: view.bounds.height),
            settingsView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            settingsView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            settingsView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            ])
        
        let contextView = UIView()
        contextView.backgroundColor = UIColor.white
        contextView.layer.cornerRadius = 4
        contextView.translatesAutoresizingMaskIntoConstraints = false
        
        settingsView.addSubview(contextView)
        
        NSLayoutConstraint.activate([
            contextView.heightAnchor.constraint(equalToConstant: 284),
            contextView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            contextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            contextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            ])
        
        // Player label
        
        let playerLabel = TopLabel()
        playerLabel.text = "Play music"
        playerLabel.font = UIFont.init(name: Constant.Font.Name.heavy,
                                       size: Constant.Font.Size.heavy)
        playerLabel.textAlignment = .center
        playerLabel.textColor = UIColor.white
        playerLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contextView.addSubview(playerLabel)
        
        NSLayoutConstraint.activate([
            playerLabel.heightAnchor.constraint(equalToConstant: 44),
            playerLabel.topAnchor.constraint(equalTo: contextView.topAnchor),
            playerLabel.leadingAnchor.constraint(equalTo: contextView.leadingAnchor),
            playerLabel.trailingAnchor.constraint(equalTo: contextView.trailingAnchor)
            ])
        
        // Player stack view
        
        let playerStackView = UIStackView(arrangedSubviews: [playButton, pauseButton, stopButton])
        playerStackView.axis = .horizontal
        playerStackView.alignment = .center
        playerStackView.distribution = .equalSpacing
        playerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contextView.addSubview(playerStackView)
        
        NSLayoutConstraint.activate([
            playButton.widthAnchor.constraint(equalToConstant: 44),
            playButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        NSLayoutConstraint.activate([
            pauseButton.widthAnchor.constraint(equalToConstant: 44),
            pauseButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 44),
            stopButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        NSLayoutConstraint.activate([
            playerStackView.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 16),
            playerStackView.leadingAnchor.constraint(equalTo: contextView.leadingAnchor, constant: 16),
            playerStackView.trailingAnchor.constraint(equalTo: contextView.trailingAnchor, constant: -16)
            ])
        
        // Game settings label

        let gameSettingsLabel = UILabel()
        gameSettingsLabel.text = "Game settings"
        gameSettingsLabel.font = UIFont.init(name: Constant.Font.Name.heavy,
                                       size: Constant.Font.Size.heavy)
        gameSettingsLabel.textAlignment = .center
        gameSettingsLabel.textColor = UIColor.white
        gameSettingsLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        gameSettingsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contextView.addSubview(gameSettingsLabel)
        
        NSLayoutConstraint.activate([
            gameSettingsLabel.heightAnchor.constraint(equalToConstant: 44),
            gameSettingsLabel.topAnchor.constraint(equalTo: playerStackView.bottomAnchor, constant: 16),
            gameSettingsLabel.leadingAnchor.constraint(equalTo: contextView.leadingAnchor),
            gameSettingsLabel.trailingAnchor.constraint(equalTo: contextView.trailingAnchor)
            ])
        
        // Multi player label
        
        let multiPlayerLabel = UILabel()
        multiPlayerLabel.text = "Multi-player"
        multiPlayerLabel.font = UIFont.init(name: Constant.Font.Name.medium,
                                             size: Constant.Font.Size.medium)
        multiPlayerLabel.textAlignment = .left
        multiPlayerLabel.textColor = UIColor.black.withAlphaComponent(0.7)
        multiPlayerLabel.backgroundColor = UIColor.white
        multiPlayerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Multi player stack view
        
        let multiPlayerStackView = UIStackView(arrangedSubviews: [multiPlayerLabel, multiPlayerSwitch])
        multiPlayerStackView.axis = .horizontal
        multiPlayerStackView.alignment = .center
        multiPlayerStackView.distribution = .equalSpacing
        multiPlayerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contextView.addSubview(multiPlayerStackView)
        
        NSLayoutConstraint.activate([
            multiPlayerStackView.topAnchor.constraint(equalTo: gameSettingsLabel.bottomAnchor, constant: 16),
            multiPlayerStackView.leadingAnchor.constraint(equalTo: contextView.leadingAnchor, constant: 16),
            multiPlayerStackView.trailingAnchor.constraint(equalTo: contextView.trailingAnchor, constant: -16)
            ])
        
        // Reset button
        
        contextView.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            resetButton.heightAnchor.constraint(equalToConstant: 44),
            resetButton.topAnchor.constraint(equalTo: multiPlayerStackView.bottomAnchor, constant: 16),
            resetButton.leadingAnchor.constraint(equalTo: contextView.leadingAnchor, constant: 16),
            resetButton.trailingAnchor.constraint(equalTo: contextView.trailingAnchor, constant: -16)
            ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: “Choosing Images with UIImagePickerController in Swift,” Coding Explorer Blog, 27-Apr-2015. [Online]. Available: http://www.codingexplorer.com/choosing-images-with-uiimagepickercontroller-in-swift/. [Accessed: 04-Apr-2017].
        imagePicker.delegate = self
        
        // URL of the Song name and type
        let path = Bundle.main.path(forResource: "Spring-In-My-Step", ofType: "mp3")
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            // set up the player by loading the sound file
            try soundPlayer = AVAudioPlayer(contentsOf: url)
        }
            // catch the error if playback fails
        catch { print("file not availalbe")}
        
    }
    
    // MARK: - Actions
    
    @objc func settingsBarButtonTapped(_ sender: UIBarButtonItem) {
        
        if isSettings == false {
            isSettings = true
            settingsView.isHidden = false
            UIView.animate(withDuration: 0.6,
                           animations: {
                            UIApplication.shared.beginIgnoringInteractionEvents()
                            self.settingsView.alpha = 1
            },
                           completion: { _ in
                            UIApplication.shared.endIgnoringInteractionEvents()
            })
        } else {
            isSettings = false
            UIView.animate(withDuration: 0.6,
                           animations: {
                            UIApplication.shared.beginIgnoringInteractionEvents()
                            self.settingsView.alpha = 0
            },
                           completion: { _ in
                            self.settingsView.isHidden = true
                            UIApplication.shared.endIgnoringInteractionEvents()
            })
        }
        
    }
    
    @objc func resetBarButtonTapped(_ sender: UIBarButtonItem) {
        start()
    }
    
    // Choosing cross symbol to play as player 1
    @objc func xButtonTapped(_ sender: UIButton) {
        currentPlayer = 1
    }
    
    // Choosing nought symbol to play as player 2
    @objc func oButtonTapped(_ sender: UIButton) {
        currentPlayer = 2
    }
    
    // When pressing one of the buttons to play the game
    @objc func cellButtonTapped(_ sender: UIButton) {
        
        let rowIndex = sender.tag / 3
        let colIndex = sender.tag % 3
        
        if grid[rowIndex][colIndex] != 0 {return}
        
        // Get to know which player press on which cell
        grid[rowIndex][colIndex] = currentPlayer
        
        // Set cross symbol for player 1
        if currentPlayer == 1 {
            sender.setImage(crossImage, for: .normal)
            sender.tintColor = UIColor.Design.tangerine
        }
            // Set nought symbol for player 2
        else if currentPlayer == 2 {
            sender.setImage(noughtImage, for: .normal)
            sender.tintColor = UIColor.Design.dafodil
        }
        
        // Get result from winlose function to variable winner
        let winner = winlose()
        
        // Check who is the winner
        switch winner {
        case 0:
            currentPlayer = (currentPlayer % 2) + 1
        case 1:
            // Winner label for player 1
            winnerLabel.text = "Player 1 is the winner!"
            
            // Alert message for player 1
            alertWinner(playerName: "Player 1")
            
            // Player 1's current score
            player1Score += 1
            
            // Plyaer 1 score label
            player1ScoreLabel.text = "Score: \(player1Score)"
            
            // Game history for player 1
            historyTextView.insertText("\nPlayer 1's result: \(player1Score)")
        case 2:
            winnerLabel.text = "Player 2 is the winner!"
            alertWinner(playerName: "Player 2")
            
            player2Score += 1
            player2ScoreLabel.text = "Score: \(player2Score)"
            historyTextView.insertText("\nPlayer 2's result: \(player2Score)")
        default:
            winnerLabel.text = "\(winner) is not matched"
        }
        
        // AI mode to check if single player mode is enabled
        if multiPlayerSwitch.isOn == false {
            let (cellIndex, gridRowIndex, gridColIndex, p2Win) = whereToPlay()
            
            // Set symbol for player 2
            cellButtons[cellIndex].setImage(noughtImage, for: .normal)
            
            // Set the grid to value 2
            grid[gridRowIndex][gridColIndex] = 2
            
            // Show alert if player 2 wins
            if p2Win == true {
                alertWinner(playerName: "Player 2")
            }
            
            // Otherwise, player 1 can now play the game
            currentPlayer = 1
        }
    }
    
    // Reset game button
    @objc func resetButtonTapped(_ sender: UIButton) {
        start()
    }
    
    // Play or resume music button
    @objc func playButtonTapped(_ sender: UIButton) {
        // play and resume
        if soundPlayer != nil{
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
        }
    }
    
    // Pause music button
    @objc func pauseButtonTapped(_ sender: UIButton) {
        if soundPlayer != nil{
            elapsedTime = soundPlayer!.currentTime
            soundPlayer!.pause()
        }
    }
    
    // Stop music button
    @objc func stopButtonTapped(_ sender: UIButton) {
        if soundPlayer != nil{
            soundPlayer!.stop()
            elapsedTime = 0
        }
    }
    
    // MARK: - Logic
    
    // Start game function
    func start() {
        grid = [[0, 0, 0] , [0, 0, 0], [0, 0, 0]]
        
        // All buttons are empty when the game starts
        for button in cellButtons {
            button.setImage(nil, for: .normal)
        }
        
        currentPlayer = 1
    }
    
    // Check if player 1 or 2 wins the match
    // 1 is player 1 wins, 2 is player 2 wins or 0 is no players win at all
    func winlose() -> Int {
        
        // First row
        if grid[0][0] != 0 && grid[0][0] == grid[0][1] && grid[0][1] == grid[0][2] {
            return grid[0][0]
        }
        
        // Second row
        if grid[1][0] != 0 && grid[1][0] == grid[1][1] && grid[1][1] == grid[1][2] {
            return grid[1][0]
        }
        
        // Third row
        if grid[2][0] != 0 && grid[2][0] == grid[2][1] && grid[2][1] == grid[2][2] {
            return grid[2][0]
        }
        
        // First column
        if grid[0][0] != 0 && grid[0][0] == grid[1][0] && grid[1][0] == grid[2][0] {
            return grid[0][0]
        }
        
        // Second column
        if grid[0][1] != 0 && grid[0][1] == grid[1][1] && grid[1][1] == grid[2][1] {
            return grid[0][1]
        }
        
        // Third column
        if grid[0][2] != 0 && grid[0][2] == grid[1][2] && grid[1][2] == grid[2][2] {
            return grid[2][2]
        }
        
        // Top right to bottom left
        if grid[0][2] != 0 && grid[0][2] == grid [1][1] && grid[1][1] == grid[2][0] {
            return grid[2][0]
        }
        
        // Top left to bottom right
        if grid[0][0] != 0 && grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] {
            return grid[2][2]
        }
        return 0
    }
    
    
    // Alert message shows who won the game
    func alertWinner(playerName : String) {
        let alertController = UIAlertController(title: "Alert", message: "\(playerName) Won!", preferredStyle: .alert)
        
        // When there is a winner, the grid will start as new game
        let okAction = UIAlertAction(title: "Ok", style: .default) {
            (action) -> Void in self.start()
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // When single player mode is on
    func whereToPlay() -> (Int, Int, Int, Bool) {
        var index = -1
        var draw = 0
        var gridRowIndex = 0
        var gridColIndex = 0
        
        for row in 0 ... 2 {
            for col in 0 ... 2 {
                index = index + 1
                
                // Check when none of the players have played the game
                if grid[row][col] == 0 {
                    
                    // Set the cell to 2
                    grid[row][col] = 2
                    
                    // Get the result from winlose function
                    var i = winlose()
                    
                    // If the value is actually 2, player 2 wins the game
                    if i == 2 {
                        return (index, row, col, true)
                    }
                    
                    // Check if the winner is player 1
                    grid[row][col] = 1
                    i = winlose()
                    
                    // If so, this means player 2 did not win the match by returning the flag as false
                    if i == 1 {
                        return (index, row, col, false)
                    }
                    
                    // When no one wins and other cells are available, player can still play the game
                    draw = index
                    gridRowIndex = row
                    gridColIndex = col
                    
                    // Set the cell to empty
                    grid[row][col] = 0
                }
            }
        }
        
        // No winner then return as false
        return (draw, gridRowIndex, gridColIndex, false)
    }
    
}

extension MainViewController: UIImagePickerControllerDelegate {

}

extension MainViewController: UINavigationControllerDelegate {

}
