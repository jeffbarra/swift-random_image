import UIKit

class ViewController: UIViewController {

    // image view box
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
       
        return imageView
    }()
    
    // button
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
       
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemIndigo,
        .systemPurple
    ]
    
    // add views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        // add image view box (imageView)
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        // add button
        view.addSubview(button)
        // specify the target (self), action (method that is called) and the control event (touchUpInside = tap)i
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        // call getRandomPhoto()
        getRandomPhoto()
        
    }
    
    // button tap function
    @objc func didTapButton() {
        getRandomPhoto()
        
        // get random background color from color array
        view.backgroundColor = colors.randomElement()
    }
    
    // adjust location of button
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    
    // getRandomPhoto function
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        
        // 'guard' checks if the optional 'url' is 'nil' and if it is, it runs the else clause
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

