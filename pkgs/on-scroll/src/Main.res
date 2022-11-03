type listener = (. int) => unit

type teardown = bool => unit

type evt_listener = unit => unit

type evt_opts = {"passive": bool, "capture": bool}

@val external addEventListener: (. string, evt_listener, evt_opts) => unit = "addEventListener"

@val
external removeEventListener: (. string, evt_listener, evt_opts) => unit = "removeEventListener"

%%private(let listeners = Js_map.make())

@val external scrollY: int = "scrollY"

%%private(
  let scrollRunner = _ => {
    let v = scrollY

    Js_map.forEach(listeners, (listener, _key) => {
      listener(. v)
    })
  }
)

@genType
let onScroll = (l, immediate) => {
  let id = listeners->Js_map.size
  let opts = ref(None)

  if !(listeners->Js_map.has(id)) {
    listeners->Js_map.set(id, l)->ignore

    if immediate {
      l(. scrollY)
    }

    if id == 0 {
      let o = {"passive": true, "capture": false}
      opts := Js.Option.some(o)
      addEventListener(. "scroll", scrollRunner, o)
    }
  }

  (. removeGlobal) => {
    listeners->Js_map.delete(id)

    if removeGlobal {
      removeEventListener(. "scroll", scrollRunner, Js.Option.getExn(opts.contents))
    }
  }
}
