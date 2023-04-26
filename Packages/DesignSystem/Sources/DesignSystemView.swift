
import SwiftUI

public struct DesignSystemView: View {

    public init() { }
    public var body: some View {
        VStack {
            Text("Hello Dear!")
        }
    }
}

#if DEBUG
struct DesignSystemView_Previews: PreviewProvider {
    static var previews: some View {
        DesignSystemView()
    }
}
#endif
