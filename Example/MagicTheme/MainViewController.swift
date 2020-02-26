//
//  MainViewController.swift
//  MagicTheme_Example
//
//  Created by yidahis on 2020/2/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    fileprivate let cellId = "MainCell"
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
       
    }

    func configUI(){
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        view.addSubview(tableView)
        
        let barBtn = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(push))
        navigationItem.rightBarButtonItem = barBtn
    }
    @objc func push(){
        var main = MainViewController()
        navigationController?.pushViewController(main, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
}
