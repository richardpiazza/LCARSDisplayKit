import GraphPoint

public protocol CartesianIdentifiable: Hashable, Identifiable<CartesianIdentifier> {
    var identifier: CartesianIdentifier? { get }
}

public extension CartesianIdentifiable {
    var identifier: CartesianIdentifier? {
        nil
    }

    var id: CartesianIdentifier {
        identifier ?? CartesianIdentifier(stringLiteral: hashValue.formatted())
    }
}
