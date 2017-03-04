(*
 * This is a simple kernel written in OCaml using the jupyter-kernel library,
 * to serve as a basic example of how to write a kernel.
 *)


let execute ~count code =
  Error "no execute"

let history req =
  Lwt.return []

let inspect req =
  Error "no inspect"

let complete ~pos code =
  Lwt.return { completion_matches: [],
               completion_start: 0,
               completion_end: 0 }

let is_complete code =
  Lwt.return Client.Kernel.Is_complete


let kernel =
  Client.Kernel.make ~language_version:[0, 0, 1]
                     ~language:"simple_kernel"
                     ~is_complete:is_complete
                     ~complete:complete
                     ~exec:execute
                     ~history:history
