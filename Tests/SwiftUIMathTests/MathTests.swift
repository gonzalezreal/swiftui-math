#if os(iOS)
  import SnapshotTesting
  import SwiftUI
  import Testing

  @testable import SwiftUIMath

  @MainActor
  struct MathTests {
    private let layout = SwiftUISnapshotLayout.device(config: .iPhone8)

    @Test
    func displayAndInlineStyles() {
      let view = VStack(alignment: .leading, spacing: 16) {
        Math("\\frac{1}{2}+\\sqrt{2}+\\sum_{i=1}^{n}x_i")
          .mathTypesettingStyle(.display)
          .mathFont(Math.Font(name: .latinModern, size: 24))

        Math("\\int_0^1 x^2\\,dx = \\frac{1}{3}")
          .mathTypesettingStyle(.text)
          .mathFont(Math.Font(name: .libertinus, size: 20))
      }
      .background(Color.guide)
      .padding(.horizontal)

      assertSnapshot(of: view, as: .image(layout: layout))
    }

    @Test
    func multicolorExpressions() {
      let view = VStack(alignment: .leading, spacing: 16) {
        Math("\\color{#cc0000}{a}+\\color{#00aa00}{b}+\\color{#0000cc}{c}")
          .mathTypesettingStyle(.text)
          .mathRenderingMode(.multicolor)
          .mathFont(Math.Font(name: .latinModern, size: 22))

        Math("\\textcolor{#ff8800}{\\int_0^1 x^2\\,dx}=\\textcolor{#0088ff}{\\frac{1}{3}}")
          .mathRenderingMode(.multicolor)
          .mathFont(Math.Font(name: .libertinus, size: 20))
      }
      .background(Color.guide)
      .padding(.horizontal)

      assertSnapshot(of: view, as: .image(layout: layout))
    }

    @Test
    func matricesAndCases() {
      let view = VStack(alignment: .leading, spacing: 16) {
        Math("A=\\begin{pmatrix}1&2\\\\3&4\\end{pmatrix}")
          .mathTypesettingStyle(.display)
          .mathFont(Math.Font(name: .asana, size: 22))

        Math("\\begin{cases} x + y = 5 \\\\ 2x - y = 1 \\end{cases}")
          .mathTypesettingStyle(.display)
          .mathFont(Math.Font(name: .termes, size: 22))
      }
      .background(Color.guide)
      .padding(.horizontal)

      assertSnapshot(of: view, as: .image(layout: layout))
    }

    @Test
    func largeOperatorsAndLimits() {
      let view = VStack(alignment: .leading, spacing: 16) {
        Math("\\lim_{n\\to\\infty}\\sum_{k=1}^{n}\\frac{1}{k^2}=\\frac{\\pi^2}{6}")
          .mathTypesettingStyle(.display)
          .mathFont(Math.Font(name: .xits, size: 22))
      }
      .background(Color.guide)
      .padding(.horizontal)

      assertSnapshot(of: view, as: .image(layout: layout))
    }

    @Test
    func inlineTextWrapping() {
      let view = VStack(alignment: .leading, spacing: 16) {
        Math("\\text{Rappelons la conversion : 1 km équivaut à 1000 m.}")
          .mathTypesettingStyle(.text)
          .mathFont(Math.Font(name: .latinModern, size: 18))
      }
      .background(Color.guide)
      .padding(.horizontal)

      assertSnapshot(of: view, as: .image(layout: layout))
    }
  }

  extension Color {
    fileprivate static var guide: Color {
      .accentColor.opacity(0.06)
    }
  }
#endif
