//
//  Created by Pavel Sharanda on 02/12/2023.
//

import UIKit

public class BookViewController: UITableViewController {
    
    public let storySets: [StorySet]
    
    public init(storySets: [StorySet]) {
        self.storySets = storySets
        super.init(style: .plain)
        self.title = "NativeBook"
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return storySets.count
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storySets[section].snippetSelectors.count
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return storySets[section].name
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId") ?? UITableViewCell()
        cell.textLabel?.text = rowTitle(for: indexPath)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selector = storySets[indexPath.section].snippetSelectors[indexPath.row]
        let storySet = storySets[indexPath.section]
        
        let storyViewController = StoryViewController(storySet: storySet, selector: selector)
        storyViewController.title = rowTitle(for: indexPath)
        
        navigationController?.pushViewController(storyViewController, animated: true)
    }
    
    private func rowTitle(for indexPath: IndexPath) -> String {
        let selector = storySets[indexPath.section].snippetSelectors[indexPath.row]
        return NSStringFromSelector(selector).replacingOccurrences(of: "snippet_", with: "")
    }
}

