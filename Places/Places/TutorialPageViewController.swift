//
//  TutorialPageViewController.swift
//  Places
//
//  Created by Marcos Navarro Pérez on 03/04/2018.
//  Copyright © 2018 Marcos Navarro Pérez. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {

    var tutorialSteps: [TutorialStep] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let firstStep = TutorialStep(index: 0, heading: "Customize", content: "Create a new place", image: #imageLiteral(resourceName: "tuto-intro-1"))
        tutorialSteps.append(firstStep)
        let secondStep = TutorialStep(index: 1, heading: "Find", content: "Find your favourite place", image: #imageLiteral(resourceName: "tuto-intro-2"))
        tutorialSteps.append(secondStep)
        let thirdStep = TutorialStep(index: 2, heading: "Discover", content: "Discover new places", image: #imageLiteral(resourceName: "tuto-intro-3"))
        tutorialSteps.append(thirdStep)
        
        dataSource = self
        if let startViewController = self.pageViewController(atIndex: 0) {
            setViewControllers([startViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func forward(toIndex: Int) {
        if let nextViewController = self.pageViewController(atIndex: toIndex + 1) {
            self.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TutorialPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialContentViewController).tutorialStep.index
        index += 1
        
        return self.pageViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! TutorialContentViewController).tutorialStep.index
        index -= 1
        
        return self.pageViewController(atIndex: index)
    }
    
    func pageViewController(atIndex: Int) -> TutorialContentViewController? {
        if atIndex == NSNotFound || atIndex < 0 || atIndex >= self.tutorialSteps.count {
            return nil
        }
        
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "walkthroughPageContent") as? TutorialContentViewController {
            pageContentViewController.tutorialStep = self.tutorialSteps[atIndex]
            
            return pageContentViewController
        }
        
        return nil
    }
    
    
    
    /*func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.tutorialSteps.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "walkthroughPageContent") as? TutorialContentViewController {
            if let tutorialStep = pageContentViewController.tutorialStep {
                return tutorialStep.index
            }
        }
        return 0
    }*/
}
