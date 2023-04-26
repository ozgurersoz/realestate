//
//  Copyright © 2023 Lvls Digital AB. All rights reserved.
//

import SwiftUI

public struct ItemDetailView: View {

    public init() { }
    public var body: some View {
        VStack {
            Text("Hello Dear!")
        }
    }
}

#if DEBUG
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView()
    }
}
#endif
