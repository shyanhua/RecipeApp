//
//  TableViewCells.swift
//  RecipeApp
//
//  Created by Shyan Hua on 22/10/2020.
//  Copyright © 2020 Shyan Hua. All rights reserved.
//

import UIKit

class TableViewCells: UITableViewCell
{
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var lblIngredients: UILabel!
    @IBOutlet weak var lblSteps: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
}
