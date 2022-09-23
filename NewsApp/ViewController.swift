//
//  ViewController.swift
//  NewsApp
//
//  Created by Qaisar Raza on 9/17/22.
//

import UIKit
import SafariServices
import WebKit

class ViewController: UIViewController {
    
    var viewModel = NewsListViewModel()
    
    private lazy var headerview: HeaderView = {
        let view = HeaderView(fontSize: 32)
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchNews()
    }
    
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(headerview)
        view.addSubview(tableView)
        setupConstraints()
    }

    func setupConstraints() {
        // header
        NSLayoutConstraint.activate([
            headerview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        // tab;eview
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: headerview.bottomAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        

    }
    
    func fetchNews() {
        
        viewModel.getNews { (_) in
            self.tableView.reloadData()
        }

    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsVM = news
        return cell  ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        guard let url = URL(string: news.url) else {
            return
        }
        
        let secondVC = UIViewController()
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        secondVC.view.addSubview(webView)
        webView.frame = secondVC.view.bounds
        self.navigationController?.pushViewController(secondVC, animated: true)

        
//        let config = SFSafariViewController.Configuration()
//        let safariViewController = SFSafariViewController(url: url, configuration: config)
//        safariViewController.modalPresentationStyle = .fullScreen
//        present(safariViewController, animated: true, completion: nil)
    }
    
}
