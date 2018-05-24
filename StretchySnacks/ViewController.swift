//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Mike Cameron on 2018-05-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    var buttons: [UIImageView]!
    weak var stackView: UIStackView!
    var counter = 0
    @IBOutlet weak var tableView: UITableView!
    var snacks: [Snack]! = [Snack]()
    var snackLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        setupSnackLabel()
        setUpStackview()
        
        tableView.dataSource = self
        
        
    }
    
    //MARK: SETUPS
    
    func setUpButtons() {
        let button1 = UIImageView()
        button1.contentMode = .scaleAspectFit
        button1.image = UIImage(named: "oreos")
        let button2 = UIImageView()
        button2.contentMode = .scaleAspectFit
        button2.image = UIImage(named: "pizza_pockets")
        let button3 = UIImageView()
        button3.contentMode = .scaleAspectFit
        button3.image = UIImage(named: "pop_tarts")
        let button4 = UIImageView()
        button4.contentMode = .scaleAspectFit
        button4.image = UIImage(named: "popsicle")
        let button5 = UIImageView()
        button5.contentMode = .scaleAspectFit
        button5.image = UIImage(named: "ramen")
        buttons = [button1, button2, button3, button4, button5]
    }
    
    func setUpStackview() {

        
        let stackView = UIStackView(arrangedSubviews: buttons)
        self.stackView = stackView
        for image in buttons {
            image.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
            image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
            image.translatesAutoresizingMaskIntoConstraints = false
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector( imageTapped))
            image.isUserInteractionEnabled = true
            image.addGestureRecognizer(tapGestureRecognizer)
        }
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .bottom
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)

        stackView.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: topView.widthAnchor).isActive = true
        stackView.isHidden = true
        self.view.layoutIfNeeded()
        }

    func setupSnackLabel() {
        let snackLabel = UILabel()
        self.snackLabel = snackLabel
        snackLabel.text = "SNACKS"
        snackLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(snackLabel)
        snackLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        snackLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
    }
    
        //MARK ACTIONS
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        guard let snackView = sender.view as? UIImageView else {
            print("help")
            return
        }
        switch snackView.image {
        case UIImage(named: "oreos"):
            let oreos = Snack(withName: "oreos")
            snacks.append(oreos)
            self.tableView.reloadData()
        case UIImage(named: "pizza_pockets"):
            let pizza_pockets = Snack(withName: "pizza pockets")
            snacks.append(pizza_pockets)
            self.tableView.reloadData()
        case UIImage(named: "pop_tarts"):
            let pop_tarts = Snack(withName: "pop tarts")
            snacks.append(pop_tarts)
            self.tableView.reloadData()
        case UIImage(named: "popsicle"):
            let popsicle = Snack(withName: "popsicle")
            snacks.append(popsicle)
            self.tableView.reloadData()
        case UIImage(named: "ramen"):
            let ramen = Snack(withName: "ramen")
            snacks.append(ramen)
            self.tableView.reloadData()
        default:
            print("help")
            }
    }
    
    
    @IBAction func plusIconPressed(_ sender: UIButton) {
        var count = counter % 2
        var trans: CGAffineTransform!
        switch count {
        case 0:
            //snackLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
            stackView.isHidden = false
            self.navHeightConstraint.constant = 200
            trans = CGAffineTransform(rotationAngle: -.pi/2)
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
                self.plusButton.transform = trans
                }, completion: nil)
        case 1:
            snackLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).constant = 40
            
            stackView.isHidden = true
            self.navHeightConstraint.constant = 66
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
                self.plusButton.transform = .identity
            }, completion: nil)
        default:
            print("help")
        }
        counter += 1
        
    }
    
    //MARK: DELEGATE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "snackCell", for: indexPath)
        cell.textLabel?.text = snacks[indexPath.row].name
        return cell
    }
    

    

}

