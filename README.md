```lua
local html = require("teil")

local rendered = html {
  html.div {
    "foo",
    html.a { href = "/index.html" } "Link!"
  },
  html.div { class = "box", id = "box1" } "Another one"
}
```

renders into

```html
<div>
    foo
    <a href="/index.html">Link!</a>
</div>
<div id="box1" class="box">
    Another one
</div>
```
