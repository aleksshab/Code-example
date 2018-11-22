//
//  ExpandableHeaderView.swift
//  CollapsibleSectionsExample
//
//  Created by Александр  on 11/22/18.
//  Copyright © 2018 goTo.Inc. All rights reserved.
//

import UIKit

class ExpandableHeaderView: UITableViewHeaderFooterView {

    @IBOutlet var titleLabel:UILabel!;

    var handler: (()->Void)?;

    override func prepareForReuse() {
        super.prepareForReuse();
        self.handler = nil;
    }

    @IBAction func headerClick(_ sender:Any){
        self.handler?();
    }

}
