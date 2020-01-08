//
//  BaubleView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 08/01/2020.
//  Copyright © 2020 Milo Hill. All rights reserved.
//

import Foundation
import SwiftUI

struct BaubleView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("BaublesGreen")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
