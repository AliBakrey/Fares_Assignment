//
//  CancellableAdapter.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import Foundation
import NetworkLayerSwift

public protocol Cancellable {
    /// A Boolean value stating whether a request is cancelled.
    var isCancelled: Bool { get }
    /// Cancels the represented request.
    func cancel()
}

class CancellableAdapter: Cancellable {
    private var canncellable:CancellableRequest?

    init(canncellable: CancellableRequest?) {
        self.canncellable = canncellable
    }

    /// A Boolean value stating whether a request is cancelled.
    var isCancelled: Bool {
        return canncellable?.isCancelled ?? false
    }

    /// Cancels the represented request.
    func cancel() {
        canncellable?.cancel()
    }
}

extension CancellableRequest {
    var cancellable: Cancellable {
        return CancellableAdapter(canncellable: self)
    }
}



