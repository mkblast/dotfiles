-- Use "qwertzuiopasfghjklyxcvbnm" for generating labels
local select = require "select"

select.label_maker = function ()
    local chars = charset("asdfqwerzxcv")
    return trim(sort(reverse(chars)))
end

-- Use Neovim as an editor
local editor = require "editor"
editor.editor_cmd = "alacritty -e nvim {file} +{line}"

-- Play Embedded Video in External Player
local modes = require("modes")
local video_cmd_fmt = "mpv --ytdl '%s'"
modes.add_binds("ex-follow", {
  { "m", "Hint all links and open the video behind that link externally with MPV.",
      function (w)
          w:set_mode("follow", {
              prompt = "open with MPV", selector = "uri", evaluator = "uri",
              func = function (uri)
                  assert(type(uri) == "string")
                  luakit.spawn(string.format(video_cmd_fmt, uri))
                  w:notify("Launched MPV")
              end
          })
      end },
  { "M", "Open the video on the current page externally with MPV.",
      function (w)
        local uri = string.gsub(w.view.uri or "", " ", "%%20")
        luakit.spawn(string.format(video_cmd_fmt, uri))
        w:notify("Launched MPV")
      end },
})
