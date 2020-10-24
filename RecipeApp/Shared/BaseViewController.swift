//
//  BaseViewController.swift
//  RecipeApp
//
//  Created by Shyan Hua on 24/10/2020.
//  Copyright © 2020 Shyan Hua. All rights reserved.
//

import Foundation
import UIKit

public class BaseViewController : UIViewController
{
    var isTapToDismissKeyboard = false
    var loadingView : UIView?
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //================================================================================
    // MARK:- Loading View
    //================================================================================
    func showLoadingView(onView : UIView)
    {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async
            {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        loadingView = spinnerView
    }
    
    func removeLoadingView()
    {
        DispatchQueue.main.async
            {
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    //================================================================================
    // MARK:- Keyboard
    //================================================================================
    @objc func keyboardWillShow(notification: NSNotification)
    {
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification)
    {
        
    }
    
    func enableTapToDismissKeyboard(enable: Bool)
    {
        isTapToDismissKeyboard = enable
        
        if enable
        {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
    }
    
    //================================================================================
    // MARK:- Private methods
    //================================================================================
    @objc private func dismissKeyboard()
    {
        view.endEditing(true)
    }
}



