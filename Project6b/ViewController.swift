//
//  ViewController.swift
//  Project6b
//
//  Created by Rob Ranf on 1/27/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.red
        label1.text = "THESE"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
//        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        /**
         - Note:
         Using Visual Format Language to define the layout. Here we need to set constraints for each of our five labels, so doing a for loop to iterate through all five, using the key we assigned each in our dictionary above. The view.addConstraints() method adds an array of constraints to the vc view. We use this array rather than a single constraint (via view.addConstraint()) because we can use VFL to generate multiple constraints at a time. The NSLayoutConstraint.constraints(withVisualFormat) method converts the VFL into the array of constraints, and takes in some parameters, the most important of which are withVisualFormat (a string of our VFL) and views. We can also use options and metrics to customize the VFL but not doing that here. The VFL itself is a string; the H means we're defining a horizontal layout, the pipe symbol means "the edge of the view". Because we're adding these contsraints to the main view (only view in this case) in our vc this means "the edge of the vc". We put whatever we want to load inside brackets (think of the brackets as the edges of our object be it a label, button, view, box, etc.) in this case a string interpolation of our label variable from our for loop to reference each key in the dictionary. So, all of this means "horizontally, I want my label# to go to the edge in my view". We used a dictionary because the VFL needs to accept a string inside the brackets, so we used the dictionary to convert each UILabel var name into a corresponding string with the same name.
         */
        
//        for label in viewsDictionary.keys {
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
//        }
        
        /**
         - Note:
         Very similar to the above but we're doing the vertical layout and using all five labels and within the VFL the "-" means "space" which is, by default, 10 points but can be customized (see the Apple dev docs on VFL). We use a metrics constant to define metrics in our constraints for repeated properties.
         */
//        let metricsVertHeight = ["labelHeight": 124]
        
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metricsVertHeight, views: viewsDictionary))
        
        /**
         - Note: We can also use auto layout anchors for constraints vs VFL
         */
        
        var previous: UILabel?
        
        let labels = [label1, label2, label3, label4, label5]
        
        for label in labels {
//            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: -10).isActive = true
            
            if let previous = previous {
                // We have a previous label, so create a new one with a constant space above of 20
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 20).isActive = true
            } else {
                // This is the first label
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            // Set the previous label to be the current one, for the next loop iteration
            previous = label
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
