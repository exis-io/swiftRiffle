
// 
// Cumin generic wrapper functions. Each overloaded function corresponds to a handler with a different number of 
// arguments and return types
//
// Generated by cuminGenerator.py
// 

import Foundation

// Converter operator. Attempts to convert the object on the right to the type given on the left
// Just here to make the cumin conversion functions just the smallest bit clearer
infix operator <- {
associativity right
precedence 155
}

func <- <T: Property> (t:T.Type, object: Any) -> T {
    // Deserialize is implemented as part of the Convertible protocol. All properties implement Convertible
    
    #if os(OSX)
        let converted = T.deserialize(object)
        print("converted: \(converted) type: \(converted.dynamicType) expected: \(t.self)")
        return unsafeBitCast(T.deserialize(object), T.self)
    #else
        return T.deserialize(object) as! T
    #endif
}

// Used only in this file to shorten the length of the method signatures
public typealias PR = Property

public extension Domain {

	public func register(endpoint: String, _ fn: () -> ()) -> Deferred {
		return _register(endpoint, []) { a in return fn() }
	}

	public func register<A: PR>(endpoint: String, _ fn: (A) -> ()) -> Deferred {
		return _register(endpoint, [A.representation()]) { a in return fn(A.self <- a[0]) }
	}

	public func register<A: PR, B: PR>(endpoint: String, _ fn: (A, B) -> ()) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1]) }
	}

	public func register<A: PR, B: PR, C: PR>(endpoint: String, _ fn: (A, B, C) -> ()) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation(), C.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2]) }
	}

	public func register<A: PR, B: PR, C: PR, D: PR>(endpoint: String, _ fn: (A, B, C, D) -> ()) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation(), C.representation(), D.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3]) }
	}

	public func register<A: PR, B: PR, C: PR, D: PR, E: PR>(endpoint: String, _ fn: (A, B, C, D, E) -> ()) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation(), C.representation(), D.representation(), E.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3], E.self <- a[4]) }
	}

	public func register<A: PR, B: PR, C: PR, D: PR, E: PR, F: PR>(endpoint: String, _ fn: (A, B, C, D, E, F) -> ()) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation(), C.representation(), D.representation(), E.representation(), F.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3], E.self <- a[4], F.self <- a[5]) }
	}

	public func register<R>(endpoint: String, _ fn: () -> (R)) -> Deferred {
		return _register(endpoint, []) { a in return fn() }
	}

	public func register<A: PR, R>(endpoint: String, _ fn: (A) -> (R)) -> Deferred {
		return _register(endpoint, [A.representation()]) { a in return fn(A.self <- a[0]) }
	}

	public func register<A: PR, B: PR, R>(endpoint: String, _ fn: (A, B) -> (R)) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1]) }
	}

	public func register<A: PR, B: PR, C: PR, R>(endpoint: String, _ fn: (A, B, C) -> (R)) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation(), C.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2]) }
	}

	public func register<A: PR, B: PR, C: PR, D: PR, R>(endpoint: String, _ fn: (A, B, C, D) -> (R)) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation(), C.representation(), D.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3]) }
	}

	public func register<A: PR, B: PR, C: PR, D: PR, E: PR, R>(endpoint: String, _ fn: (A, B, C, D, E) -> (R)) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation(), C.representation(), D.representation(), E.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3], E.self <- a[4]) }
	}

	public func register<A: PR, B: PR, C: PR, D: PR, E: PR, F: PR, R>(endpoint: String, _ fn: (A, B, C, D, E, F) -> (R)) -> Deferred {
		return _register(endpoint, [A.representation(), B.representation(), C.representation(), D.representation(), E.representation(), F.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3], E.self <- a[4], F.self <- a[5]) }
	}

	public func subscribe(endpoint: String, _ fn: () -> ()) -> Deferred {
		return _subscribe(endpoint, []) { a in return fn() }
	}

	public func subscribe<A: PR>(endpoint: String, _ fn: (A) -> ()) -> Deferred {
		return _subscribe(endpoint, [A.representation()]) { a in return fn(A.self <- a[0]) }
	}

	public func subscribe<A: PR, B: PR>(endpoint: String, _ fn: (A, B) -> ()) -> Deferred {
		return _subscribe(endpoint, [A.representation(), B.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1]) }
	}

	public func subscribe<A: PR, B: PR, C: PR>(endpoint: String, _ fn: (A, B, C) -> ()) -> Deferred {
		return _subscribe(endpoint, [A.representation(), B.representation(), C.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2]) }
	}

	public func subscribe<A: PR, B: PR, C: PR, D: PR>(endpoint: String, _ fn: (A, B, C, D) -> ()) -> Deferred {
		return _subscribe(endpoint, [A.representation(), B.representation(), C.representation(), D.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3]) }
	}

	public func subscribe<A: PR, B: PR, C: PR, D: PR, E: PR>(endpoint: String, _ fn: (A, B, C, D, E) -> ()) -> Deferred {
		return _subscribe(endpoint, [A.representation(), B.representation(), C.representation(), D.representation(), E.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3], E.self <- a[4]) }
	}

	public func subscribe<A: PR, B: PR, C: PR, D: PR, E: PR, F: PR>(endpoint: String, _ fn: (A, B, C, D, E, F) -> ()) -> Deferred {
		return _subscribe(endpoint, [A.representation(), B.representation(), C.representation(), D.representation(), E.representation(), F.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3], E.self <- a[4], F.self <- a[5]) }
	}
}


// Deferred handler overloads
public extension HandlerDeferred {
    
	public func then<A: PR>(fn: (A) -> ()) -> Deferred {
		return _then([A.representation()]) { a in return fn(A.self <- a[0]) }
	}

	public func then<A: PR, B: PR>(fn: (A, B) -> ()) -> Deferred {
		return _then([A.representation(), B.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1]) }
	}

	public func then<A: PR, B: PR, C: PR>(fn: (A, B, C) -> ()) -> Deferred {
		return _then([A.representation(), B.representation(), C.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2]) }
	}

	public func then<A: PR, B: PR, C: PR, D: PR>(fn: (A, B, C, D) -> ()) -> Deferred {
		return _then([A.representation(), B.representation(), C.representation(), D.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3]) }
	}

	public func then<A: PR, B: PR, C: PR, D: PR, E: PR>(fn: (A, B, C, D, E) -> ()) -> Deferred {
		return _then([A.representation(), B.representation(), C.representation(), D.representation(), E.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3], E.self <- a[4]) }
	}

	public func then<A: PR, B: PR, C: PR, D: PR, E: PR, F: PR>(fn: (A, B, C, D, E, F) -> ()) -> Deferred {
		return _then([A.representation(), B.representation(), C.representation(), D.representation(), E.representation(), F.representation()]) { a in return fn(A.self <- a[0], B.self <- a[1], C.self <- a[2], D.self <- a[3], E.self <- a[4], F.self <- a[5]) }
	}

}

