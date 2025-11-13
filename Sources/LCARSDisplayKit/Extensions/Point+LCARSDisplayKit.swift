import GraphPoint

extension CartesianPoint: @retroactive Identifiable {
    public var id: Int { hashValue }
}
