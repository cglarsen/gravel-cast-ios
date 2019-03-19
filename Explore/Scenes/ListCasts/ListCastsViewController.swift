//
//  ListCastsViewController.swift
//  Explore
//
//  Created by Christian Graver on 20/12/2018.
//  Copyright (c) 2018 nordgrus. All rights reserved.
//
//  This file was generated by the Daman Clean Swift Xcode Templates
//  with inspiration from http://clean-swift.com
//

import UIKit
import SnapKit

protocol ListCastsDisplayLogic: class {
    func display(casts: [ListCasts.DisplayData.Cast])
}

class ListCastsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "CastCell", bundle: nil), forCellReuseIdentifier: "CastCell")
            tableView.allowsSelection = true
            tableView.separatorInset = .zero
            tableView.separatorStyle = .none
            tableView.backgroundColor = .clear
        }
    }
    
    // MARK: - Properties
    var interactor: ListCastsBusinessLogic?
    var router: (NSObjectProtocol & ListCastsRoutingLogic & ListCastsDataPassing)?
    var casts = [ListCasts.DisplayData.Cast]()
    
    // MARK: - Init
    class func instantiate() -> ListCastsViewController {
        let name = "\(ListCastsViewController.self)"
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name) as! ListCastsViewController
        vc.setup()
        return vc
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = ListCastsInteractor()
        let presenter = ListCastsPresenter()
        let router = ListCastsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewCreated()
    }
    
    // MARK: - Actions
    
    // MARK: - Interactor interaction
    func viewCreated() {
        let request = ListCasts.Request.ViewCreated()
        interactor?.viewCreated(request: request)
    }
    
    // MARK: - Router interaction
    func navigateToCast(for index: Int) {
        router?.navigateToCast(for: index)
    }
    
    // MARK: - Misc
    private func setupView() {
        view.backgroundColor = UIColor.gcLightGreen
    }
}

extension ListCastsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.selectionStyle = .none
        if let cast = casts[safe: indexPath.row],
            let castCell = tableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath) as? CastCell {
            castCell.backgroundColor = .clear
            castCell.nameLabel.text = cast.name
            castCell.selectionStyle = .none
            castCell.regionLabel.text = cast.region
            castCell.numberOfPointsLabel.text =  cast.numberOfDiscoveryPoints == 1 ? "\(cast.numberOfDiscoveryPoints) discovery point" :
                                                                                        "\(cast.numberOfDiscoveryPoints) discovery points"
            cell = castCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoWhite")
        imageView.contentMode = .scaleAspectFit
        
        headerView.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(headerView.snp.centerX)
            make.height.equalTo(100)
        }
        return headerView
    }
}

extension ListCastsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToCast(for: indexPath.row)
    }
}


// MARK: - ListCastsDisplayLogic
extension ListCastsViewController: ListCastsDisplayLogic {
    func display(casts: [ListCasts.DisplayData.Cast]) {
        self.casts = casts
        tableView.reloadData()
    }
}
