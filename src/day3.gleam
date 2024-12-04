import gleam/int
import gleam/option
import gleam/regexp
import gleam/result

fn interpret_mul(match: regexp.Match) -> Int {
  let assert [option.Some(first), option.Some(second)] = match.submatches
  result.unwrap(int.parse(first), 0) * result.unwrap(int.parse(second), 0)
}

fn interpret_loop(matches: List(regexp.Match), acc: Int, enabled: Bool) -> Int {
  case matches {
    [] -> acc
    [match, ..tail] ->
      case match, enabled {
        regexp.Match("do()", _), _ -> interpret_loop(tail, acc, True)
        regexp.Match("don't()", _), _ -> interpret_loop(tail, acc, False)
        _, True -> interpret_loop(tail, acc + interpret_mul(match), enabled)
        _, _ -> interpret_loop(tail, acc, enabled)
      }
  }
}

pub fn star1(input: String) -> Int {
  let assert Ok(regex) = regexp.from_string("mul\\((\\d+),(\\d+)\\)")
  regexp.scan(regex, input) |> interpret_loop(0, True)
}

pub fn star2(input: String) -> Int {
  let assert Ok(regex) =
    "mul\\((\\d+),(\\d+)\\)|do\\(\\)|don't\\(\\)"
    |> regexp.from_string
  regexp.scan(regex, input) |> interpret_loop(0, True)
}
