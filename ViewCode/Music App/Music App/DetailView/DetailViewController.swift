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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene}).first?.windows.filter({$0.isKeyWindow}).first
        let topPadding = window?.safeAreaInsets.top
        print(scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y >= 300 {
            self.screen?.navBarTopAnchor?.constant = 0
        } else{
            self.screen?.navBarTopAnchor?.constant = -((topPadding ?? 0.0) + 80)
        }
        self.animationWithView()
                                    
    }
    private func animationWithView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            return
        }
        
        self.view.layoutIfNeeded()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.screen?.playerView.setUpPlayerView(data: self.cardModel?.cardList?[indexPath.row] ?? CardListModel() )
        self.screen?.playerViewBottomAnchor?.constant = 0
        self.animationWithView()
    }
}
