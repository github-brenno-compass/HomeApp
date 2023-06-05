//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import HomeScenes

enum UserDestination {
    case error(Error)
    case repositories(RepositoriesFeatureScene.Repositories)
    case back
}
