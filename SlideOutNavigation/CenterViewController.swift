//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by Avinav Goel on 12/03/16.
//  Copyright © 2016 Avinav Goel. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
  optional func toggleLeftPanel()
  optional func toggleRightPanel()
  optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
  
  @IBOutlet weak private var imageView: UIImageView!
  @IBOutlet weak private var titleLabel: UILabel!
  @IBOutlet weak private var creatorLabel: UILabel!
  
  var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions
  
  @IBAction func kittiesTapped(sender: AnyObject) {
    delegate?.toggleLeftPanel?()
  }
  
  @IBAction func puppiesTapped(sender: AnyObject) {
    delegate?.toggleRightPanel?()
  }
  
}

extension CenterViewController: SidePanelViewControllerDelegate {
func animalSelected(animal: Animal) {
    imageView.image = animal.image
    titleLabel.text = animal.title
    creatorLabel.text = animal.creator
    
    delegate?.collapseSidePanels?()
  }
}