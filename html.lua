local function render(template)
    if type(template) == "table" then
      local rendered = ""
      for _, v in ipairs(template) do
        rendered = rendered .. render(v)
      end
      return rendered
    elseif type(template) == "string" then
      return template
    elseif type(template) == "function" then
      return template()
    end
end

local function render_props(props)
  if props == nil then
    return ""
  elseif type(props) == "table" then
    local out = ""
    for k, v in pairs(props) do
      out = out .. " " .. ('%s="%s"'):format(k, v)
    end
    return out
  end
end

local html = {
  render = render
}

return setmetatable(html, {
  __index = function (_, tag)
    return function (props)
      return function(data)
        if data == nil then
          data = props
          props = nil
        end
        return ("<%s%s>%s</%s>"):format(
          tag,
          render_props(props),
          render(data),
          tag
        )
      end
    end
  end,
  __call = function (_, table)
    return render(table)
  end
})
