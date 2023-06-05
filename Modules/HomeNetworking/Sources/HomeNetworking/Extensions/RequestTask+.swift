//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

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
