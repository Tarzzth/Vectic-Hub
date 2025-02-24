local placeid = game.PlaceId

if placeid == 3101667897 then 
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Tarzzth/Vectic-Hub/refs/heads/main/script.lua"))()
else
  game.Players.LocalPlayer:Kick("Script not Support Maps")
  wait(3)
  game:Shutdown()
end
