//
//  LoadFailedView.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 14/5/26.
//

import SwiftUI

struct LoadFailedView: View {

    var error: Error?
    var onRetry: () -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Load Error")
                .font(.headline)
        } description: {
            Text("\(error?.localizedDescription ?? "There was an error loading the articles")")
        } actions: {
            Button("Retry") {
                onRetry()
            }
        }
    }
}

#Preview {
    LoadFailedView(error: NSError(domain: "TakeHomeProject", code: 1), onRetry: {
        //do nothing
    })
}
