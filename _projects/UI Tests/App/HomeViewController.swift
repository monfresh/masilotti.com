import UIKit

class HomeViewController: UIViewController {
    let toggleTextButton = UIButton(type: .system)
    let pushDetailButton = UIButton(type: .system)
    let presentModalButton = UIButton(type: .system)
    let textLabel = UILabel()

    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white

        installStackView()
        installToggleTextButton()
        installPushDetailButton()
        installPresentModalButton()
        installTextLabel()
    }

    private func installStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: stackView.topAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        ])
    }

    private func installToggleTextButton() {
        toggleTextButton.setTitle("Toggle text", for: .normal)
        toggleTextButton.addTarget(self, action: #selector(showText), for: .touchUpInside)
        stackView.addArrangedSubview(toggleTextButton)
    }

    private func installPushDetailButton() {
        pushDetailButton.setTitle("Push detail", for: .normal)
        pushDetailButton.addTarget(self, action: #selector(pushDetail), for: .touchUpInside)
        stackView.addArrangedSubview(pushDetailButton)
    }

    private func installPresentModalButton() {
        presentModalButton.setTitle("Present modal", for: .normal)
        presentModalButton.addTarget(self, action: #selector(presentModal), for: .touchUpInside)
        stackView.addArrangedSubview(presentModalButton)
    }

    private func installTextLabel() {
        textLabel.text = "Some text"
        textLabel.isHidden = true
        stackView.addArrangedSubview(textLabel)
    }
    
    @objc private func showText() {
        textLabel.isHidden = !textLabel.isHidden
    }

    @objc private func pushDetail() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

    @objc private func presentModal() {
        present(ModalViewController(), animated: true)
    }
}
