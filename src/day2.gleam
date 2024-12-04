import gleam/int
import gleam/list
import gleam/string

fn parse_reports(input: String) -> List(List(Int)) {
  use report <- list.map(string.split(input, on: "\n"))
  string.split(report, on: " ") |> list.filter_map(int.parse)
}

fn possible_safe_reports(report: List(Int)) -> List(List(Int)) {
  use acc, _, index <- list.index_fold(report, list.new())
  case list.split(report, index) {
    #(heads, [_remove, ..tail]) -> [list.append(heads, tail), ..acc]
    #(heads, []) -> [heads, ..acc]
  }
}

fn evaluate_report_safety_loop(report: List(Int), last_sign: Int) -> Bool {
  case report {
    [first, second, ..tail] -> {
      let diff = first - second
      let diff_abs = int.absolute_value(diff)
      let diff_sign = diff / diff_abs
      let diff_valid = diff_abs >= 1 && diff_abs <= 3
      let sign_same = diff_sign == last_sign || last_sign == 0
      case diff_valid && sign_same {
        True -> evaluate_report_safety_loop([second, ..tail], diff_sign)
        False -> False
      }
    }
    _ -> True
  }
}

fn evaluate_report_safety_dampened(report: List(Int)) -> Bool {
  case evaluate_report_safety_loop(report, 0) {
    True -> True
    False ->
      possible_safe_reports(report)
      |> list.any(evaluate_report_safety_loop(_, 0))
  }
}

pub fn star1(input: String) -> Int {
  parse_reports(input) |> list.count(evaluate_report_safety_loop(_, 0))
}

pub fn star2(input: String) -> Int {
  parse_reports(input) |> list.count(evaluate_report_safety_dampened)
}
