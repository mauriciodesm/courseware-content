import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static public let identifier: String = "DetailTableViewCell"
    
    var screen: DetailTableViewCellScreen = DetailTableViewCellScreen()
        

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setUpView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        self.contentView.addSubview(self.screen)
    }
    
    private func setUpConstraints(){
        self.screen.pin(to: self.contentView)
    }
    
    public func setUpCell(data: CardListModel){
        self.screen.setUpCell(data: data)
    }
    
}
