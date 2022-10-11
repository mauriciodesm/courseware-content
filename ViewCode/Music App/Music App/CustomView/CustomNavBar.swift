import UIKit

class CustomNavBar: UIView {
    
    lazy var categoryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var featureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.7)
        return view
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(self.cardImage)
        self.addSubview(self.overlayView)
        self.addSubview(self.categoryTitle)
        self.addSubview(self.cardTitle)
        self.addSubview(self.featureLabel)
    }
    
    private func setUpConstraints(){
        self.cardImage.pin(to: self)
        self.overlayView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.categoryTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.cardTitle.topAnchor.constraint(equalTo: self.categoryTitle.bottomAnchor, constant: 5),
            self.cardTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.cardTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.featureLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor, constant: 5),
            self.featureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.featureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    public func setUpView(data:CardViewModel){
        self.cardTitle.text = data.cardTitle
        self.categoryTitle.text = data.categoryName
        self.cardImage.image = UIImage(named: data.cardImage ?? "")
        self.featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
    
}
