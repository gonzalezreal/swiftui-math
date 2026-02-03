import SwiftUI

@available(iOS 17.0, *)
extension Math {
  /// Controls how colors are applied when rendering math.
  public enum RenderingMode: Sendable {
    /// Draws all glyphs using the view's foreground style.
    case monochrome
    /// Honors LaTeX color commands and uses the base color for uncolored glyphs.
    case multicolor(base: SwiftUI.Color)

    /// Multicolor rendering using the view's primary color as the base.
    public static var multicolor: Self {
      .multicolor(base: .primary)
    }
  }
}

@available(iOS 17.0, *)
extension View {
  /// Sets the rendering mode for ``Math`` views in this hierarchy.
  public func mathRenderingMode(_ mathRenderingMode: Math.RenderingMode) -> some View {
    environment(\.mathRenderingMode, mathRenderingMode)
  }
}

@available(iOS 17.0, *)
extension EnvironmentValues {
  @Entry var mathRenderingMode: Math.RenderingMode = .monochrome
}
