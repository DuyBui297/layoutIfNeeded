//
//  ViewController.swift
//  ExampleLayoutSubview
//
//  Created by Macbook on 9/6/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

import UIKit

class NibView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class RedView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    translatesAutoresizingMaskIntoConstraints = false
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    print("required init?(coder aDecoder: NSCoder)")
    fatalError("init(coder:) has not been implemented")
  }
  
//  override func awakeFromNib() {
//    print("awakeFromNib()")
//    super.awakeFromNib()
//    self.backgroundColor = .blue
//    self.layer.cornerRadius = self.frame.width / 2
//    self.layer.shadowRadius = 9
//    layer.shadowOpacity = 0.3
//    layer.shadowOffset = CGSize(width: 5, height: 8)
//    self.clipsToBounds = false
//  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    print("layoutSubviews RedView")
  }
}

class ViewController: UIViewController {

  
  let redView = RedView()
  @IBOutlet weak var redHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var yellowHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var blueHeightConstraint: NSLayoutConstraint!
  
  override func loadView() {
    super.loadView()
    print("loadView()")
  }
  
  @IBAction func didTapOnButton(_ sender: Any) {
    test02()
  }
  
  private func test02() {
    redHeightConstraint.constant = 50
    let animator = UIViewPropertyAnimator(duration: 5, timingParameters: UICubicTimingParameters(animationCurve: .linear))
    animator.addAnimations {
      self.view.layoutIfNeeded()
    }

    animator.startAnimation()
  }
  
  private func test01() {
    self.redHeightConstraint.constant = 30
    //    self.blueHeightConstraint.constant = 40
    //    self.yellowHeightConstraint.constant = 50
    //    self.view.setNeedsLayout()
    self.view.layoutIfNeeded()
    
    //    self.blueHeightConstraint.constant = 40
    //    self.yellowHeightConstraint.constant = 50
    //    self.view.setNeedsLayout()
    print("AAA")
    sleep(5)
    //    self.yellowHeightConstraint.constant = 50
    print("Here")
    
    //    UIView.animate(withDuration: 2) {
    ////      self.redView.center = CGPoint(x: 0, y: 0)
    //
    //      self.view.layoutIfNeeded()
    //    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad()")
    view.addSubview(redView)
    redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    redView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
  }
  
  override func viewDidLayoutSubviews() {
    print("viewDidLayoutSubviews()")
//    redView.backgroundColor = .blue
//    redView.layer.cornerRadius = redView.frame.width / 2
//    redView.layer.shadowRadius = 9
//    redView.layer.shadowOpacity = 0.3
//    redView.layer.shadowOffset = CGSize(width: 5, height: 8)
//    redView.clipsToBounds = false
  }
  
  override func viewWillLayoutSubviews() {
    print("viewWillLayoutSubviews()")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    print("viewDidAppear()")
    redView.backgroundColor = .blue
    redView.layer.cornerRadius = redView.frame.width / 2
    redView.layer.shadowRadius = 9
    redView.layer.shadowOpacity = 0.3
    redView.layer.shadowOffset = CGSize(width: 5, height: 8)
    redView.clipsToBounds = false
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print("viewWillAppear()")
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    print("viewWillDisappear()")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    print("viewDidDisappear()")
  }
}

