import Foundation

class CodableHelper {
    func decodeNetworkObject<D: Decodable>(object: Data) throws -> D {
        do {
            let target = try JSONDecoder().decode(D.self, from: object)
            return target
        } catch {
            throw error
        }
    }
}
