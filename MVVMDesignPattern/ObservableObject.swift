//
//  ObservableObject.swift
//  MVVMDesignPattern
//
//  Created by Dowon Kim on 05/08/2023.
//

import Foundation

// This class will support or have different types so I'm goint to use "Generics"
final class ObservableObject<T> {
    
    //if a change happen to the value object, it will send notification(or will broadcast)
    var value: T {
        // whenever a value is set,it's going to use the listner to broadcast to whomever listening.
        didSet{
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    // function allowed to listen! ;)
    func bind(_ listenr: @escaping(T) -> Void) {
        //This is the bind method, so set "var listenr" to be whatever closure is passed in
        listenr(value)
        self.listener = listenr //<- The moment a user binds to this particular observable object, send(or trigger) a notification.
        
    }
    
}
