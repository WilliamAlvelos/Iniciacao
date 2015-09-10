//
//  PageContentViewController.swift
//  Iniciacao
//
//  Created by Marjorie Alvelos on 2015-09-06.
//  Copyright (c) 2015 William Alvelos. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

        
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var bkImageView: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!

    
    var pageIndex: Int?
    var titleText : String!
    var imageName : String!
    
    
    private var y =  Float(10)
    private var x:Float = 10
    
    var events = Array<Animal>()
    
    
    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.bkImageView.image = UIImage(named: imageName)
        self.navigationController?.navigationItem.title = self.titleText
        self.navigationController?.navigationBar.translucent = false
        self.title = self.titleText
        self.heading.text = self.titleText
        self.heading.alpha = 0.1
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.heading.alpha = 1.0
        })
        
        
        var animal = Animal();
        animal.nome = "Girafa"
        
        for(var i = 0 ; i < 20; i++){
            self.events.append(animal)
        }
        
        self.events.append(animal)
        self.events.append(animal)
        
        self.scroll.showsVerticalScrollIndicator = false
        self.scroll.showsHorizontalScrollIndicator = false
        
        prepareScroll()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareScroll(){
        let width = CGFloat((UIScreen.mainScreen().bounds.size.width - 30) / 2)
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let scrollBarHeight = self.navigationController?.navigationBar.frame.height
        self.scroll.contentSize = CGSizeMake(screenWidth , CGFloat((events.count+1)/2) *  CGFloat(width + 10))
        
        x = 10
        y = 10
        for (var i = 0 ; i < events.count ; i++){
            let cartaView = CartaView(frame: CGRectMake(CGFloat(x), CGFloat(y), width, width))
            cartaView.label.text = events[i].nome
            
            cartaView.button.tag = i
            cartaView.button.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
            x = alterna(x)
            self.scroll.addSubview(cartaView)
        }
        
    }
    
    private func alterna(number : Float)->Float{
        let width = CGFloat((UIScreen.mainScreen().bounds.size.width - 30) / 2) + 20
        if Float(width) == x {
            y = y + Float(width) - 10
            return 10
        }
        return Float(width)
    }
    func buttonTapped(sender : UIButton){
        print("change")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Animal") as! AnimalViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }

    
}
