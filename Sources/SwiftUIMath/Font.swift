import SwiftUI

extension Math {
  /// Identifies a math font and size used for typesetting.
  public struct Font: Hashable, Sendable {
    /// Known math font names bundled with the package.
    public struct Name: Hashable, Sendable, RawRepresentable, ExpressibleByStringLiteral {
      /// The raw font name used in the bundle.
      public let rawValue: String

      /// Creates a name from a raw font string.
      public init(rawValue: String) {
        self.rawValue = rawValue
      }

      /// Creates a name from a string literal.
      public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
      }
    }

    /// The bundled font name.
    public let name: Name
    /// The font size in points.
    public let size: CGFloat

    /// Creates a font configuration.
    public init(name: Name, size: CGFloat) {
      self.name = name
      self.size = size
    }
  }
}

extension Math.Font.Name {
  /// Latin Modern Math.
  public static let latinModern: Self = "latinmodern-math"
  /// KpMath Light.
  public static let kpMathLight: Self = "KpMath-Light"
  /// KpMath Sans.
  public static let kpMathSans: Self = "KpMath-Sans"
  /// XITS Math.
  public static let xits: Self = "xits-math"
  /// TeX Gyre Termes Math.
  public static let termes: Self = "texgyretermes-math"
  /// Asana Math.
  public static let asana: Self = "Asana-Math"
  /// Euler Math.
  public static let euler: Self = "Euler-Math"
  /// Fira Math.
  public static let fira: Self = "FiraMath-Regular"
  /// Noto Sans Math.
  public static let notoSans: Self = "NotoSansMath-Regular"
  /// Libertinus Math.
  public static let libertinus: Self = "LibertinusMath-Regular"
  /// Garamond Math.
  public static let garamond: Self = "Garamond-Math"
  /// Lete Sans Math.
  public static let leteSans: Self = "LeteSansMath"
}

extension View {
  /// Sets the math font used by ``Math`` views in this hierarchy.
  public func mathFont(_ font: Math.Font) -> some View {
    environment(\.mathFont, font)
  }
}

extension EnvironmentValues {
  @Entry var mathFont = Math.Font(name: .latinModern, size: 20)
}
