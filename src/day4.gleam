import gleam/int
import gleam/list
import gleam/regexp
import gleam/string

fn skipping_xmas_pattern(amount: Int) -> String {
  let skip = "[\\w\\n]{" <> int.to_string(amount) <> "}"
  "X(?=" <> skip <> "M" <> skip <> "A" <> skip <> "S)"
}

fn count_xmas(input: String, width: Int) -> Int {
  let assert Ok(diag_r) = skipping_xmas_pattern(width + 1) |> regexp.from_string
  let assert Ok(down) = skipping_xmas_pattern(width) |> regexp.from_string
  let assert Ok(diag_l) = skipping_xmas_pattern(width - 1) |> regexp.from_string
  let assert Ok(right) = "XMAS" |> regexp.from_string
  [right, diag_r, down, diag_l]
  |> list.map(fn(re) { regexp.scan(re, input) |> list.length })
  |> int.sum
}

fn count_x_mas(input: String, width: Int) -> Int {
  let skip = "[\\w\\n]{" <> int.to_string(width - 1) <> "}"
  let m_left = "[\\w\\n]S" <> skip <> "A" <> skip <> "M[\\w\\n]S"
  let m_top = "[\\w\\n]M" <> skip <> "A" <> skip <> "S[\\w\\n]S"
  let pattern = "M(?=" <> m_left <> "|" <> m_top <> ")"
  let assert Ok(re) = pattern |> regexp.from_string
  regexp.scan(re, input) |> list.length
}

pub fn star1(input: String) -> Int {
  let assert Ok(#(first_line, _)) = string.split_once(input, "\n")
  let width = string.length(first_line)
  count_xmas(input, width) + count_xmas(input |> string.reverse, width)
}

pub fn star2(input: String) -> Int {
  let assert Ok(#(first_line, _)) = string.split_once(input, "\n")
  let width = string.length(first_line)
  count_x_mas(input, width) + count_x_mas(input |> string.reverse, width)
}
