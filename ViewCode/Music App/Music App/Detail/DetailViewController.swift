import UIKit

class DetailViewController: UIViewController {
    
    
    var screen: DetailViewControllerScreen?
    var cardModel: CardViewModel?
    
    override func loadView() {
        self.screen = DetailViewControllerScreen(dataView: self.cardModel)
        self.screen?.configAllDelegates(tableViewDelegate: self, tableViewDataSource: self, scrollViewDelegate: self, detailViewScreenDelegate: self)
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

extension DetailViewController: UIScrollViewDelegate, DetailViewControllerScreenDelegate{
    func tappedCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cardModel?.cardList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell
        cell?.setUpCell(data: self.cardModel?.cardList?[indexPath.row] ?? CardListModel() )
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
