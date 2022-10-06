import UIKit

class CardActionView: UIView {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var downloadView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var notInterestedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var playView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var likeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var moreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var downloadButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var notInterestedButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var playButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 35
        btn.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var likeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var moreButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraintrs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.notInterestedView)
        self.stackView.addArrangedSubview(self.playView)
        self.stackView.addArrangedSubview(self.likeView)
        
        self.downloadView.addSubview(self.downloadButton)
        self.notInterestedView.addSubview(self.notInterestedButton)
        self.playView.addSubview(self.playButton)
        self.likeView.addSubview(self.likeButton)
        self.moreView.addSubview(self.moreButton)
    }
    
    private func setupConstraintrs(){
        self.stackView.pin(to: self)
        NSLayoutConstraint.activate([
            self.downloadButton.centerXAnchor.constraint(equalTo: self.downloadView.centerXAnchor),
            self.downloadButton.centerYAnchor.constraint(equalTo: self.downloadView.centerYAnchor),
            self.downloadButton.widthAnchor.constraint(equalToConstant: 45),
            self.downloadButton.heightAnchor.constraint(equalToConstant: 45),
            
            self.notInterestedButton.centerXAnchor.constraint(equalTo: self.notInterestedView.centerXAnchor),
            self.notInterestedButton.centerYAnchor.constraint(equalTo: self.notInterestedView.centerYAnchor),
            self.notInterestedButton.widthAnchor.constraint(equalToConstant: 45),
            self.notInterestedButton.heightAnchor.constraint(equalToConstant: 45),
            
            self.playButton.centerXAnchor.constraint(equalTo: self.playView.centerXAnchor),
            self.playButton.centerYAnchor.constraint(equalTo: self.playView.centerYAnchor),
            self.playButton.widthAnchor.constraint(equalToConstant: 70),
            self.playButton.heightAnchor.constraint(equalToConstant: 70),
            
            self.likeButton.centerXAnchor.constraint(equalTo: self.likeView.centerXAnchor),
            self.likeButton.centerYAnchor.constraint(equalTo: self.likeView.centerYAnchor),
            self.likeButton.widthAnchor.constraint(equalToConstant: 45),
            self.likeButton.heightAnchor.constraint(equalToConstant: 45),
            
            self.moreButton.centerXAnchor.constraint(equalTo: self.moreView.centerXAnchor),
            self.moreButton.centerYAnchor.constraint(equalTo: self.moreView.centerYAnchor),
            self.moreButton.widthAnchor.constraint(equalToConstant: 45),
            self.moreButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    public func updateLayout(for mode: ViewMode){
        if mode == .full{
            self.downloadView.isHidden = false
            self.moreView.isHidden = false
            self.stackView.addArrangedSubview(self.downloadView)
            self.stackView.addArrangedSubview(self.notInterestedView)
            self.stackView.addArrangedSubview(self.playView)
            self.stackView.addArrangedSubview(self.likeView)
            self.stackView.addArrangedSubview(self.moreView)
        } else {
            self.downloadView.isHidden = true
            self.moreView.isHidden = true
            self.stackView.removeArrangedSubview(self.downloadView)
            self.stackView.removeArrangedSubview(self.moreView)
        }
        
    }
}
