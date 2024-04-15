import UIKit

class OnBoardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func setupUi() {
        let background = createOnBoardingBackground(view: view, name: "onboarding")
        let button = createStartingButton()
        button.addTarget(self, action: #selector(navigateToMainVC), for: .touchUpInside)
        view.sendSubviewToBack(background)
        createOnBoardingLabel()
        
    }
    
    @objc func navigateToMainVC() {
        let mainView = MainViewController()
        navigationController?.pushViewController(mainView, animated: true)
        
    }
    
    func createStartingButton() -> UIButton {
        let button = UIButton()
        let color = UIColor(red: 0x00/255, green: 0x75/255, blue: 0xFF/255, alpha: 1.0)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 123).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        button.titleLabel?.font = UIFont(name: "FiraGO-Regular", size: 14)
        button.setTitle("დაწყება", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = color
        
        return button
    }
    
    func createOnBoardingLabel() {
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -91).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 382).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -238).isActive = true
        label.font = UIFont(name: "FiraGO-Regular", size: 30)
        label.numberOfLines = 0
        label.text = "დააჭირეთ დაწყების ღილაკს ახალი ქარდების დასამატებლად"
        label.textColor = .white
        label.setLineHeight(48)
    }

}

#Preview {
    OnBoardingViewController()
}
