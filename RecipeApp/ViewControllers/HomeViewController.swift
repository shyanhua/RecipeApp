//
//  ViewController.swift
//  RecipeApp
//
//  Created by Shyan Hua on 22/10/2020.
//  Copyright © 2020 Shyan Hua. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource
{
    // UI Elements
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeaderView: UIView!
    @IBOutlet weak var btnAdd: UIButton!
    
    // Stored Properties
    
    //================================================================================
    // MARK:- Override methods
    //================================================================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let identifier = segue.identifier
        {
            switch identifier
            {
            case Constants.SEGUE.RECIPE_DETAIL:
                if let destinationVC = segue.destination as? RecipeDetailViewController
                {
                    
                }
                break
            default:
                break
            }
        }
    }

    //================================================================================
    // MARK:- Private Methods
    //================================================================================
    private func initUI()
    {
        let nib = UINib(nibName: Constants.TABLEVIEWCELLS.TABLE_VIEW_CELLS, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.TABLEVIEWCELLS.TABLE_VIEW_CELLS)
        tableView.tableHeaderView = tableHeaderView
        
        btnAdd.layer.borderWidth = 2
        btnAdd.layer.borderColor = UIColor.gray.cgColor
        btnAdd.layer.cornerRadius = 10
        
        if let xmlPath = Bundle.main.path(forResource: "Recipe", ofType: "xml"), let xmlNSData = NSData(contentsOfFile: xmlPath)
        {
            let data = Data(referencing: xmlNSData)

            let p = XMLParsing()
            p.setData(data: data)
        }
    }
    
    //================================================================================
    // MARK:- Buttons
    //================================================================================
    @IBAction func btnAddOnClicked(_ sender: Any)
    {
        performSegue(withIdentifier: Constants.SEGUE.RECIPE_DETAIL, sender: self)
    }
    
    //================================================================================
    // MARK:- UITableViewDelegate
    //================================================================================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TABLEVIEWCELLS.TABLE_VIEW_CELLS, for: indexPath) as! TableViewCells
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: Constants.SEGUE.RECIPE_DETAIL, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150
    }
}

