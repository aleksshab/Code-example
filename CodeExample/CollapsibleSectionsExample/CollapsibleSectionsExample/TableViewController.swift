//
//  TableViewController.swift
//  CollapsibleSections
//
//  Created by Denis Popov on 30/10/2018.
//  Copyright © 2018 Denis Popov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var sections = [
        Section(frameworkName: "UIKit",
                components: ["UIButton и UILable",
                             "UISegmentedControl",
                             "UISlider"],
                expanded: false),
        Section(frameworkName: "ARKit",
                components: ["ARSession",
                             "ARConfiguration",
                             "ARSKView"],
                expanded: false),
        Section(frameworkName: "MapKit",
                components: ["MKMapView",
                             "MKPlacemark",
                             "MKMapItem",
                             "MKMapCamera"],
                expanded: false),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tableView.register(UINib(nibName: "ExpandableHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header");
        self.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Footer");
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section];
        return section.expanded ? section.components.count : 0;
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.section].components[indexPath.row];
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! ExpandableHeaderView;
        view.titleLabel.text = sections[section].frameworkName;
        view.handler = { [weak self] in
            if let `self` = self {
                let expanded = self.sections[section].expanded;
                self.sections[section].expanded = !expanded;
                self.tableView.reloadSections(IndexSet(integer: section), with: .none);
            }
        }
        return view;
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "Footer");
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
