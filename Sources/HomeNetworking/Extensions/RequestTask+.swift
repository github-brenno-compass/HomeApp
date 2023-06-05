//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import RequestDL
import GithubKit

extension RequestTask {

    func logoutErrorWhenTokenExpires() -> AnyTask<Element> where Element: TaskResultPrimitive {
        onStatusCode(.unauthorized) { _ in
            throw LogoutError()
        }
        .eraseToAnyTask()
    }
}

extension RequestTask<Data> {

    func replaceEmptyData<Value: StringProtocol>(with value: Value) -> AnyTask<Element> {
        map {
            guard $0.isEmpty else {
                return $0
            }

            return Data(value.utf8)
        }
        .eraseToAnyTask()
    }
}
