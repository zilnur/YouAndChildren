import Foundation

protocol Subscriber {
    func removeText()
    func id() -> IndexPath?
}

protocol ViewInputProtocol {
    func addCell()
    func removeCell()
    func removeAll()
    func setItemsCount() -> Int
    func addSubscriber(subscriber: Subscriber)
    func deleteAllText()
    func deleteSubscribers(at: Int)
    func removeAllSubscribers()
}

class Presenter: ViewInputProtocol {
    
    var view: ViewOutputProtocol?
    
    var subscribers = [Subscriber]() {
        didSet {
            print("qqq: \(subscribers)")
        }
    }
    
    // Имитация модели для работы таблицы
    var model: Int = 0 {
        didSet {
            if model == 5 {
                view?.deactivateButton()
            }
        }
    }
    
    // Настройка кол-ва ячеек
    func setItemsCount() -> Int {
        model
    }
    
    // Прибавление ячейки
    func addCell() {
        model += 1
    }
    
    // Удаление ячейки
    func removeCell() {
        model -= 1
    }
    
    // Удаление всех ячеек
    func removeAll() {
        model = 0
    }
    
    // Подписка TextField, для управления ими
    func addSubscriber(subscriber: Subscriber){
        if (!subscribers.contains(where: {$0.id() == subscriber.id()})) {
        subscribers.append(subscriber)
        }
    }
    
    // Удаление текста во всех текстфилдах
    func deleteAllText() {
        subscribers.forEach{$0.removeText()}
    }
    
    func deleteSubscribers(at: Int) {
        subscribers.remove(at: at)
        print(subscribers.count)
    }
    
    //Удаление всех подписок TextField
    func removeAllSubscribers() {
        subscribers.removeAll()
    }
}
