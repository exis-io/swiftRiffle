//
//  App.swift
//  Pods
//
//  Created by damouse on 3/7/16.
//
//

import Foundation
import Mantle

class App {
    var mantleDomain: UInt64
    
    var deferreds: [UInt64: Deferred] = [:]
    var handlers: [UInt64: [Any] -> ()] = [:]
    var registrations: [UInt64: [Any] -> Any?] = [:]
    
    
    init(domain: UInt64) {
        mantleDomain = domain
    }
    
    func receive() {
        while true {
            var (i, args) = decode(Receive(self.mantleDomain))
            
            if let d = deferreds[i] {
                // remove the deferred (should this ever be optional?)
                deferreds[d.cb] = nil
                deferreds[d.eb] = nil
                
                if d.cb == i {
                    d.callback(args)
                }
                
                if d.eb == i {
                    d.errback(args)
                }
            } else if let fn = handlers[i] {
                fn(args)
            } else if let fn = registrations[i] {
                let resultId = args.removeAtIndex(0) as! Double
                
                // Optional serialization has some problems. This unwraps the result to avoid that particular issue
                if let ret = fn(args) {
                    // Function did not return anything
                    if let _ = ret as? Void {
                        Yield(mantleDomain, UInt64(resultId), marshall([]))
                        
                    // Function returned well known serializable types
                    } else if let _ = ret as? Property {
                        Yield(mantleDomain, UInt64(resultId), marshall([ret]))
                        
                    // Function returned something we can't check-- assume its a tuple
                    } else {
                        let unpacked = unpackTuple(ret)
                        print("Tuple before: \(ret), after: \(unpacked)")
                        Yield(mantleDomain, UInt64(resultId), marshall(unpacked))
                    }
                } else {
                    let empty: [Any] = []
                    Yield(mantleDomain, UInt64(resultId), marshall(empty))
                }
            }
        }
    }
}

// Here for testing. May break terribly on ubuntu, in which case core changes are needed to allow tupled returns
// Takes a tuple and returns it as an array
func unpackTuple(tuple: Any) -> [Any] {
    let mirror = Mirror(reflecting: tuple)
    return mirror.children.map { $0.value as Any }
}