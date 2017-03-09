(*
 * This is a simple kernel written in OCaml using the jupyter-kernel library,
 * to serve as a basic example of how to write a kernel.
 *)

open Jupyter_kernel

let execute ~count code =
  Lwt.return (Error "no execute")

let history req =
  Lwt.return []

let inspect req =
  Lwt.return (Error "no inspect")

let complete ~pos code =
  Lwt.return { Client.Kernel.completion_matches = [];
               Client.Kernel.completion_start = 0;
               Client.Kernel.completion_end = 0 }

let is_complete code =
  Lwt.return Client.Kernel.Is_complete


let kennel =
  Client.Kernel.make ~language_version:[0; 0; 1]
                     ~language:"simple_kernel"
                     ~is_complete:is_complete
                     ~complete:complete
                     ~inspect:inspect
                     ~history:history
                     ~exec:execute
                     ()

let () =
  Lwt_main.run (Client_main.main ~usage:"simple very" kennel)
