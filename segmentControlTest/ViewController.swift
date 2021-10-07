//
//  ViewController.swift
//  segmentControlTest
//
//  Created by Marco Nissen on 07.10.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: SegmentedProgressView!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.segmentGap = 5
        progressBar.segmentCount = 5
        progressBar.activeIndex = 0
        progressBar.segmentColor = .systemGray
        progressBar.activeSegmentColor = .systemBlue
    }
    @IBAction func clickBack(_ sender: Any) {
        if progressBar.activeIndex > 0 {
            progressBar.activeIndex = progressBar.activeIndex - 1
        }
        updateButtons()
    }
    
    @IBAction func clickNext(_ sender: Any) {
        if progressBar.activeIndex < progressBar.segmentCount - 1 {
            progressBar.activeIndex = progressBar.activeIndex + 1
        }
        updateButtons()
    }

    func updateButtons() {
        buttonBack.isEnabled = (progressBar.activeIndex > 0)
        buttonNext.isEnabled = (progressBar.activeIndex < progressBar.segmentCount - 1)
    }
}

