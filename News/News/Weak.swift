import Foundation

/// A box that allows us to weakly hold on to an object
struct Weak<Object: AnyObject> {
    weak var value: Object?
}
