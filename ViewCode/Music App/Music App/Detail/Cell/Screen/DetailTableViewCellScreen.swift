
import UIKit

class DetailTableViewCellScreen: UIView {

    lazy var thumbImage : UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "demo")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste nome"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subtítulo"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
        self.setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        self.addSubview(self.thumbImage)
        self.addSubview(self.title)
        self.addSubview(self.subTitle)
        self.addSubview(self.likeButton)
        self.addSubview(self.moreButton)
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            self.thumbImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.thumbImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.thumbImage.heightAnchor.constraint(equalToConstant: 60),
            self.thumbImage.widthAnchor.constraint(equalToConstant: 60),
            
            self.title.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor, constant: 15),
            self.title.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            
            self.subTitle.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor, constant: 15),
            self.subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 4),
            
            self.moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.moreButton.widthAnchor.constraint(equalToConstant: 35),
            self.moreButton.heightAnchor.constraint(equalToConstant: 35),
            self.moreButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.likeButton.trailingAnchor.constraint(equalTo: self.moreButton.leadingAnchor, constant: -15),
            self.likeButton.widthAnchor.constraint(equalToConstant: 35),
            self.likeButton.heightAnchor.constraint(equalToConstant: 35),
            self.likeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    public func setUpCell(data:CardListModel){
        self.title.text = data.listTitle
        self.subTitle.text = data.listSubtitle
        self.thumbImage.image = UIImage(named: data.listImage ?? "")
    }
    
}
