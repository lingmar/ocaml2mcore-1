(* Linear congruential generator: https://en.wikipedia.org/wiki/Linear_congruential_generator *)
let lcg m a c x =
  (a * x + c) mod m

(* Generates a random number between 0 and 1073741789 *)
(* Parameters to LCG taken from
   https://www.ams.org/journals/mcom/1999-68-225/S0025-5718-99-00996-5/S0025-5718-99-00996-5.PDP
*)
let rand seed =
  let r = lcg 1073741789 771645345 0 seed in
  r

let rand_list n =
  List.init n (fun i -> rand (i + 1))

let rec quicksort seq =
  match seq with
  | [] -> seq
  | h :: t ->
    let l, r = List.partition (fun x -> x < h) t in
    (quicksort l) @ (h :: (quicksort r))

let _ =
  10
  |> int_of_string
  |> rand_list
  |> quicksort
  |> List.map string_of_int
  |> String.concat "\n"
  |> print_endline
