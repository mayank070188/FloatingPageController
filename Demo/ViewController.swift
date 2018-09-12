//
//  ViewController.swift
//  Demo
//
//  Created by mAc on 9/5/18.
//  Copyright © 2018 mAc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var containerView:UIView!
    
    @IBOutlet weak var pageScrollView:UIScrollView!
    @IBOutlet weak var subScrollView1:UIScrollView!
    @IBOutlet weak var subScrollView2:UIScrollView!
    
    @IBOutlet weak var pageControl1:UIPageControl!
    @IBOutlet weak var pageControl2:UIPageControl!
    
    var view1,view2,view3:UIView!
    var view4,view5,view6:UIView!
    
    
    @IBOutlet weak var subScrollView1HeightConstraint:NSLayoutConstraint!
    @IBOutlet weak var subScrollView2HeightConstraint:NSLayoutConstraint!
    @IBOutlet weak var containerViewHeight:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        setup()
        setup2()
        refresh()
    }
    func setup()
    {
        for i in 0..<3
        {
            switch i {
                case 0:
                    view1 = UIView(frame: CGRect(x: CGFloat(i) * subScrollView1.bounds.size.width, y: 0, width: subScrollView1.bounds.size.width, height: subScrollView1.bounds.size.height))
                    view1.backgroundColor = UIColor.blue
                    subScrollView1.addSubview(view1)
                case 1:
                    view2 = UIView(frame: CGRect(x: CGFloat(i) * subScrollView1.bounds.size.width, y: 0, width: subScrollView1.bounds.size.width, height: self.view.frame.height - 300))
                    view2.backgroundColor = UIColor.black
                    subScrollView1.addSubview(view2)
                case 2:
                    view3 = UIView(frame: CGRect(x: CGFloat(i) * subScrollView1.bounds.size.width, y: 0, width: subScrollView1.bounds.size.width, height: self.view.frame.height-100))
                    view3.backgroundColor = UIColor.orange
                    subScrollView1.addSubview(view3)
            default:
                print("None")
            }
        }
        subScrollView1.contentSize = CGSize(width: 3 * subScrollView1.bounds.size.width, height: subScrollView1.bounds.height)
        pageControl1.numberOfPages = 3
    }
    func setup2()
    {
        for i in 0..<3
        {
            switch i {
            case 0:
                view4 = UIView(frame: CGRect(x: CGFloat(i) * subScrollView2.bounds.size.width, y: 0, width: subScrollView2.bounds.size.width, height: subScrollView2.bounds.size.height))
                view4.backgroundColor = UIColor.blue
                subScrollView2.addSubview(view4)
            case 1:
                view5 = UIView(frame: CGRect(x: CGFloat(i) * subScrollView2.bounds.size.width, y: 0, width: subScrollView2.bounds.size.width, height: self.view.frame.height - 300))
                view5.backgroundColor = UIColor.black
                subScrollView2.addSubview(view5)
            case 2:
                view6 = UIView(frame: CGRect(x: CGFloat(i) * subScrollView2.bounds.size.width, y: 0, width: subScrollView2.bounds.size.width, height: self.view.frame.height-100))
                view6.backgroundColor = UIColor.orange
                subScrollView2.addSubview(view6)
            default:
                print("None")
            }
        }
        subScrollView2.contentSize = CGSize(width: 3 * subScrollView2.bounds.size.width, height: subScrollView2.bounds.height)
        pageControl2.numberOfPages = 3
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == subScrollView1
        {
            let page = scrollView.contentOffset.x/scrollView.frame.size.width
            pageControl1.currentPage = Int(page)
            switch(pageControl1.currentPage)
            {
            case 0:
                subScrollView1HeightConstraint.constant = view1.bounds.height
            case 1:
                subScrollView1HeightConstraint.constant = view2.bounds.height
            case 2:
                 subScrollView1HeightConstraint.constant = view3.bounds.height
            default:
                print("Default")
            }
               refresh()
        }
        else if scrollView == subScrollView2
        {
            let page = scrollView.contentOffset.x/scrollView.frame.size.width
            pageControl2.currentPage = Int(page)
            switch(pageControl2.currentPage)
            {
            case 0:
                subScrollView2HeightConstraint.constant = view4.bounds.height
            case 1:
                subScrollView2HeightConstraint.constant = view5.bounds.height
            case 2:
                subScrollView2HeightConstraint.constant = view6.bounds.height
            default:
                print("Default2")
            }
               refresh()
        }
     
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == subScrollView1 || scrollView == subScrollView2
        {
           // refresh()
        }
    }
    func refresh()
    {
        UIView.animate(withDuration: 1.0, animations: {
            self.containerViewHeight.constant = self.subScrollView1.frame.origin.y + self.subScrollView1HeightConstraint.constant + self.subScrollView2HeightConstraint.constant + 100
        })
      //  self.containerView.layoutIfNeeded()
    }

}

