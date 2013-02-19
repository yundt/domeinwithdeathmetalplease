class WelcomeController < ApplicationController

  def index
    @nowplaying = `osascript -e 'tell application "System Events"
    set myList to (name of every process)
end tell
if myList contains "Spotify" then
    tell application "Spotify"
    if player state is stopped then
    set output to "Stopped"
    else
    set trackname to name of current track
    set artistname to artist of current track
    set albumname to album of current track
    if player state is playing then
    set output to trackname & " | " & artistname & " | " & albumname
    else if player state is paused then
    set output to trackname & " | " & artistname & " | " & albumname
    end if
    end if
    end tell
else
    set output to "Spotify is not running"
end if'`
  end

  def up
    `osascript -e 'set currentVolume to output volume of (get volume settings)
    set volume output volume (currentVolume + 4)'`
    render nothing: true
  end

  def down
    `osascript -e 'set currentVolume to output volume of (get volume settings)
    set volume output volume (currentVolume - 4)'`
    render nothing: true
  end

end
