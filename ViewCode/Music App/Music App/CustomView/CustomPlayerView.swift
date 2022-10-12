import UIKit
import MarqueeLabel

class CustomPlayerView: UIView {

    var videoTimer: Timer?
    var time: CGFloat = 0.0
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var marqueeLabel: MarqueeLabel = {
        let label = MarqueeLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 18)
        label.textColor = .white.withAlphaComponent(0.8)
        label.type = .continuous
        label.animationCurve = .linear
        label.fadeLength = 10.0
        label.leadingBuffer = 30.0
        label.trailingBuffer = 30.0
        return label
    }()
    
    lazy var pausePlayButton: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "pause")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white.withAlphaComponent(0.8)
        return image
    }()
        
    lazy var trackBar: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.progressTintColor = .yellow.withAlphaComponent(0.8)
        view.progress = 0.0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.setUpView()
        self.setUpConstraints()    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        self.addSubview(self.imageView)
        self.addSubview(self.marqueeLabel)
        self.addSubview(self.pausePlayButton)
        self.addSubview(self.trackBar)
        
        self.videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
        
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 90),
            
            self.marqueeLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 10),
            self.marqueeLabel.trailingAnchor.constraint(equalTo: self.pausePlayButton.leadingAnchor, constant: -5),
            self.marqueeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            
            self.pausePlayButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.pausePlayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            self.pausePlayButton.heightAnchor.constraint(equalToConstant: 40),
            self.pausePlayButton.widthAnchor.constraint(equalToConstant: 40),
            
            self.trackBar.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor),
            self.trackBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.trackBar.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    @objc func changeTrackBar(){
        self.time += 0.001
        self.trackBar.progress = Float(self.time / 120)
        if self.time >= 120{
            self.videoTimer?.invalidate()
            self.videoTimer = nil
        }
    }
    
    public func setUpPlayerView(data:CardListModel){
        self.imageView.image = UIImage(named: data.listImage ?? "")
        self.marqueeLabel.text = data.listTitle
        self.time = 0.0
        self.trackBar.progress = 0.0
        self.videoTimer = nil
        self.videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
    }
}
