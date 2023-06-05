//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import GithubKit

public enum HomeApp: MiniApp {

    public static func start() {
        Assembler.run([
            DomainAssembly(),
            AppDataAssembly(),
            NetworkingAssembly(),
            StorageAssembly()
        ])
    }
}
