//
//  StarView.swift
//  ChristmasTree
//
//  Created by Milo Hill on 08/01/2020.
//  Copyright © 2020 Milo Hill. All rights reserved.
//

import Foundation
import SwiftUI

struct StarView: View {
    @ObservedObject var viewModel: StarViewModel

    var body: some View {
        return ZStack(alignment: .center) {
            Image("Star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(viewModel.opacityDark)

            Image("Star Bright")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(viewModel.opacityLight)
        }
    }
}
