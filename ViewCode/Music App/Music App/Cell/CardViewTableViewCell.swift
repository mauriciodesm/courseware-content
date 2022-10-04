import UIKit

class CardViewTableViewCell: UITableViewCell {

    static let identifier:String = "CardViewTableViewCell"
    
    lazy var cardView: CustomCardView = {
       let view = CustomCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
        self.selectionStyle = .none

    }
    
    public func setupCell(data: CardViewModel){
        self.cardView.setupView(data: data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView(){
        self.contentView.addSubview(self.cardView)
    }
    
    fileprivate func setupConstraints(){
        self.cardView.pin(to: self)
    }
    
}
