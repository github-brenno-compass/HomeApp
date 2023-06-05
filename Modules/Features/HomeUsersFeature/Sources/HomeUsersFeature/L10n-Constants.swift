// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum UserView {
    /// Entrar
    internal static let bio = L10n.tr("Localizable", "UserView.bio", fallback: "Entrar")
    /// Empresa
    internal static let company = L10n.tr("Localizable", "UserView.company", fallback: "Empresa")
    /// Ver perfil completo
    internal static let fullProfileLink = L10n.tr("Localizable", "UserView.fullProfileLink", fallback: "Ver perfil completo")
    /// Cadastrar
    internal static let location = L10n.tr("Localizable", "UserView.location", fallback: "Cadastrar")
    /// Repositórios
    internal static let repositoriesButton = L10n.tr("Localizable", "UserView.repositoriesButton", fallback: "Repositórios")
    /// Detalhes de %@
    internal static func title(_ p1: Any) -> String {
      return L10n.tr("Localizable", "UserView.title", String(describing: p1), fallback: "Detalhes de %@")
    }
  }
  internal enum UsersView {
    /// Sair
    internal static let logout = L10n.tr("Localizable", "UsersView.logout", fallback: "Sair")
    /// Usuários
    internal static let title = L10n.tr("Localizable", "UsersView.title", fallback: "Usuários")
    internal enum EmptyView {
      /// Não encontramos nenhum repositório do usuário
      internal static let description = L10n.tr("Localizable", "UsersView.EmptyView.description", fallback: "Não encontramos nenhum repositório do usuário")
      /// Repositórios
      internal static let title = L10n.tr("Localizable", "UsersView.EmptyView.title", fallback: "Repositórios")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type all
