//
//  ListItem.swift
//  Todoey
//
//  Created by Денис Богданенко on 13.02.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

class ListItem {
    var id: String;
    var title: String;
    var selected: Bool = false;
    
    init (id: String, title: String, selected: Bool) {
        self.id = id;
        self.title = title;
        self.selected = selected;
    };
    
    // switched selected state from true to false and vice versa
    // and returns new value of it
    func toggle () {
        selected = !selected;
    };
}
