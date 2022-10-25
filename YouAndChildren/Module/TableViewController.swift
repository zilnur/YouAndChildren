import UIKit

protocol ViewOutputProtocol {
    func deactivateButton()
}

class TableViewController: UITableViewController {
    
    //MARK: - Properties
    
    private let presenter: ViewInputProtocol
    
    private lazy var secondHeader = SecondHeaderView { [weak self] in
        guard let self = self else {return}
        self.presenter.addCell()
        self.tableView.beginUpdates()
        let numberOfRows = self.tableView.numberOfRows(inSection: 1)
        self.tableView.insertRows(at: [IndexPath(item: numberOfRows, section: 1)], with: .fade)
        self.tableView.endUpdates()
        self.tableView.reloadData()
    }
    
    //MARK: - init
    
    init(presenter: ViewInputProtocol) {
        self.presenter = presenter
        super.init(style: .grouped)
        tableView.register(ParentTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(ChildTableViewCell.self, forCellReuseIdentifier: "Child")
        tableView.separatorColor = .clear
        tableView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return presenter.setItemsCount()
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ParentTableViewCell else { return UITableViewCell()}
            cell.indexPath = indexPath
            presenter.addSubscriber(subscriber: cell)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Child", for: indexPath) as? ChildTableViewCell else{ return UITableViewCell()}
            cell.indexPath = indexPath
            cell.closure = { [weak self] in
                guard let self = self else {return}
                self.presenter.removeCell()
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
                tableView.reloadData()
                cell.removeText()
                self.presenter.deleteSubscribers(at: indexPath.item)
                self.secondHeader.addButton()
            }
            presenter.addSubscriber(subscriber: cell)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let firstHeader = FirstHeaderView()
            return firstHeader
        case 1:
            return secondHeader
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let view = SecondSectionFooterView { [weak self] in
                guard let self = self else {return}
                let alertController = UIAlertController(title: "Подтвердите сброс данных",
                                                        message: nil,
                                                        preferredStyle: .actionSheet)
                let alert = UIAlertAction(title: "Сбросить данные",
                                          style: .default) {_ in
                    self.presenter.deleteAllText()
                    self.presenter.removeAllSubscribers()
                    self.presenter.removeAll()
                    self.secondHeader.addButton()
                    tableView.reloadData()
                }
                let cancelAlert = UIAlertAction(title: "Отмена",
                                                style: .destructive)
                [alert, cancelAlert].forEach(alertController.addAction(_:))
                DispatchQueue.main.async {
                    self.present(alertController, animated: true)
                }
            }
            return view
        default:
            return nil
        }
    }
    
}

extension TableViewController: ViewOutputProtocol {
    
    func deactivateButton() {
        secondHeader.deactivateButton()
    }
    
}
