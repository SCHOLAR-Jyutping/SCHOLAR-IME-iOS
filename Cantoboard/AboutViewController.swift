//
//  AboutViewController.swift
//  Cantoboard
//
//  Created by Alex Man on 23/11/21.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static let sections: [[(image: UIImage, title: String, url: String)]] = [
        [
            (CellImage.externalLink, LocalizedStrings.about_typeduckSite, "https://typeduck.hk"),
            (CellImage.externalLink, LocalizedStrings.about_jyutpingSite, "https://lshk.org/jyutping-scheme/"),
            (CellImage.sourceCode, LocalizedStrings.about_sourceCode, "https://github.com/TypeDuck-HK/TypeDuck-iOS"),
            (CellImage.sourceCode, LocalizedStrings.about_cantoboard, "https://github.com/Cantoboard/Cantoboard"),
        ],
        [
            (CellImage.repository, "Rime Input Method Engine", "https://github.com/rime/librime"),
            /*
            (CellImage.repository, "Rime Cantonese Input Schema", "https://github.com/rime/rime-cantonese"),
            (CellImage.repository, "Rime 倉頡三代", "https://github.com/Arthurmcarthur/Cangjie3-Plus"),
            (CellImage.repository, "Rime 倉頡五代", "https://github.com/Jackchows/Cangjie5"),
            (CellImage.repository, "Rime 速成", "https://github.com/rime/rime-quick"),
            (CellImage.repository, "Rime 筆劃", "https://github.com/rime/rime-stroke"),
            */
            (CellImage.repository, "Open Chinese Convert (OpenCC)", "https://github.com/BYVoid/OpenCC"),
            (CellImage.repository, "ISEmojiView", "https://github.com/isaced/ISEmojiView"),
        ],
        [
            (CellImage.email, LocalizedStrings.about_email, "mailto:info@typeduck.hk"),
            (CellImage.rate, LocalizedStrings.about_appStore, "https://apps.apple.com/us/app/typeduck/id0000000000"),
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = LocalizedStrings.other_about
        view.backgroundColor = .systemBackground
        let tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { Self.sections.count + 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 0
        default: return Self.sections[section - 1].count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 2: return LocalizedStrings.about_credit
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0: return LocalizedStrings.about_description
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Self.sections[indexPath.section - 1][indexPath.row]
        return UITableViewCell(title: row.title, image: row.image)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let url = URL(string: Self.sections[indexPath.section - 1][indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
}
