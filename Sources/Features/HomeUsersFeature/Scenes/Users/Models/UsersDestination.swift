//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit

enum UsersDestination {
    case error(Error)
    case logout
    case user(UserScene)
}
