# Backgrounds to show in credits. Found in Graphics/Titles/ folder
CreditsBackgroundList = ["credits1","credits2","credits3","credits4","credits5"]
CreditsMusic          = "Credits"
CreditsScrollSpeed    = 2
CreditsFrequency      = 9   # Number of seconds per credits slide
CREDITS_OUTLINE       = Color.new(0,0,128, 255)
CREDITS_SHADOW        = Color.new(0,0,0, 100)
CREDITS_FILL          = Color.new(255,255,255, 255)

#==============================================================================
# * Scene_Credits
#------------------------------------------------------------------------------
# Scrolls the credits you make below. Original Author unknown.
#
## Edited by MiDas Mike so it doesn't play over the Title, but runs by calling
# the following:
#    $scene = Scene_Credits.new
#
## New Edit 3/6/2007 11:14 PM by AvatarMonkeyKirby.
# Ok, what I've done is changed the part of the script that was supposed to make
# the credits automatically end so that way they actually end! Yes, they will
# actually end when the credits are finished! So, that will make the people you
# should give credit to now is: Unknown, MiDas Mike, and AvatarMonkeyKirby.
#                                             -sincerly yours,
#                                               Your Beloved
# Oh yea, and I also added a line of code that fades out the BGM so it fades
# sooner and smoother.
#
## New Edit 24/1/2012 by Maruno.
# Added the ability to split a line into two halves with <s>, with each half
# aligned towards the centre. Please also credit me if used.
#
## New Edit 22/2/2012 by Maruno.
# Credits now scroll properly when played with a zoom factor of 0.5. Music can
# now be defined. Credits can't be skipped during their first play.
#
## New Edit 25/3/2020 by Maruno.
# Scroll speed is now independent of frame rate. Now supports non-integer values
# for CreditsScrollSpeed.
#
## New Edit 21/8/2020 by Marin.
# Now automatically inserts the credits from the plugins that have been
# registered through the PluginManager module.
#==============================================================================

class Scene_Credits

# This next piece of code is the credits.
#Start Editing
CREDIT=<<_END_

Scripting, game design, mapping, 
graphic editing and writing by:
TastyRedTomato

Beta Testers:
Varakri<s>Aurorabeam
Carricx<s>quish the noodle

General "Pok??Tracker" functionalities by:
TastyRedTomato

"Easy Questing System" was created by:
M3rein

"Roamtracker" was created by:
TastyRedTomato

"CardGameTournament" was created by:
TastyRedTomato

"Pok??mon Import/Export" was created by:
TastyRedTomato

"Tradestone NPC" was created by:
TastyRedTomato

"PVP" was created by:
Hansiec

"Better Fast-Forward" was created by:
Marin

"Animated Title Screen" and "Neo PauseMenu" were created by:
Luka S.J.

"Nuzlocke Mode" was created by:
JV

"Randomizer Mode" was created by:
Umbreon

#"Pok??mon Follower" was created by:
#Help-14<s>zingzags
#Rayd12smitty<s>Venom12
#mej71

"Footprints" was created by:
Klein

"Whirlpool and lava graphics" were created by:
DormDude<s>Rayquaza-dot

"Location signposts" were created by:
LostSoulsDev
carmaniac<s>PurpleZaffre

"Booster Packs and Controls Screen" were created by:
FL

"Prevent Deactivation" was created by:
KK20

"RGSS_linker and FmodEx Audio Module" were created by:
Nuri Yuri

Special thanks to:
Thundaga for the great tutorial videos
The pok??mon community in general

and you




{INSERTS_PLUGIN_CREDITS_DO_NOT_REMOVE}
"Pok??mon Essentials" was created by:
Flameguru
Poccil (Peter O.)
Maruno

With contributions from:
AvatarMonkeyKirby<s>Marin
Boushy<s>MiDas Mike
Brother1440<s>Near Fantastica
FL.<s>PinkMan
Genzai Kawakami<s>Popper
help-14<s>Rataime
IceGod64<s>SoundSpawn
Jacob O. Wobbrock<s>the__end
KitsuneKouta<s>Venom12
Lisa Anthony<s>Wachunga
Luka S.J.<s>
and everyone else who helped out



"RPG Maker XP" by:
Enterbrain

Pok??mon is owned by:
The Pok??mon Company
Nintendo
Affiliated with Game Freak

This is a non-profit fan-made game.
No copyright infringements intended.
Please support the official games!

_END_
#Stop Editing

  def main
#-------------------------------
# Animated Background Setup
#-------------------------------
    @sprite = IconSprite.new(0,0)
    @backgroundList = CreditsBackgroundList
    @frameCounter = 0
    # Number of game frames per background frame
    @framesPerBackground = CreditsFrequency * Graphics.frame_rate
    @sprite.setBitmap("Graphics/Titles/"+@backgroundList[0])
#------------------
# Credits text Setup
#------------------
    plugin_credits = ""
    PluginManager.plugins.each do |plugin|
      pcred = PluginManager.credits(plugin)
      plugin_credits << "\"#{plugin}\" version #{PluginManager.version(plugin)}\n"
      if pcred.size >= 5
        plugin_credits << pcred[0] + "\n"
        i = 1
        until i >= pcred.size
          plugin_credits << pcred[i] + "<s>" + (pcred[i + 1] || "") + "\n"
          i += 2
        end
      else
        pcred.each do |name|
          plugin_credits << name + "\n"
        end
      end
      plugin_credits << "\n"
    end
    CREDIT.gsub!(/\{INSERTS_PLUGIN_CREDITS_DO_NOT_REMOVE\}/, plugin_credits)
    credit_lines = CREDIT.split(/\n/)
    credit_bitmap = Bitmap.new(Graphics.width,32 * credit_lines.size)
    credit_lines.each_index do |i|
      line = credit_lines[i]
      line = line.split("<s>")
      # LINE ADDED: If you use in your own game, you should remove this line
      pbSetSystemFont(credit_bitmap) # <--- This line was added
      xpos = 0
      align = 1 # Centre align
      linewidth = Graphics.width
      for j in 0...line.length
        if line.length>1
          xpos = (j==0) ? 0 : 20 + Graphics.width/2
          align = (j==0) ? 2 : 0 # Right align : left align
          linewidth = Graphics.width/2 - 20
        end
        credit_bitmap.font.color = CREDITS_SHADOW
        credit_bitmap.draw_text(xpos,i * 32 + 8,linewidth,32,line[j],align)
        credit_bitmap.font.color = CREDITS_OUTLINE
        credit_bitmap.draw_text(xpos + 2,i * 32 - 2,linewidth,32,line[j],align)
        credit_bitmap.draw_text(xpos,i * 32 - 2,linewidth,32,line[j],align)
        credit_bitmap.draw_text(xpos - 2,i * 32 - 2,linewidth,32,line[j],align)
        credit_bitmap.draw_text(xpos + 2,i * 32,linewidth,32,line[j],align)
        credit_bitmap.draw_text(xpos - 2,i * 32,linewidth,32,line[j],align)
        credit_bitmap.draw_text(xpos + 2,i * 32 + 2,linewidth,32,line[j],align)
        credit_bitmap.draw_text(xpos,i * 32 + 2,linewidth,32,line[j],align)
        credit_bitmap.draw_text(xpos - 2,i * 32 + 2,linewidth,32,line[j],align)
        credit_bitmap.font.color = CREDITS_FILL
        credit_bitmap.draw_text(xpos,i * 32,linewidth,32,line[j],align)
      end
    end
    @trim = Graphics.height/10
    @realOY = -(Graphics.height-@trim)   # -430
    @oyChangePerFrame = CreditsScrollSpeed*20.0/Graphics.frame_rate
    @credit_sprite = Sprite.new(Viewport.new(0,@trim,Graphics.width,Graphics.height-(@trim*2)))
    @credit_sprite.bitmap = credit_bitmap
    @credit_sprite.z      = 9998
    @credit_sprite.oy     = @realOY
    @bg_index = 0
    @zoom_adjustment = 1.0/$ResizeFactor
    @last_flag = false
#--------
# Setup
#--------
    # Stops all audio but background music
    previousBGM = $game_system.getPlayingBGM
    pbMEStop
    pbBGSStop
    pbSEStop
    pbBGMFade(2.0)
    pbBGMPlay(CreditsMusic)
    Graphics.transition(20)
    loop do
      Graphics.update
      Input.update
      update
      break if $scene != self
    end
    Graphics.freeze
    @sprite.dispose
    @credit_sprite.dispose
    $PokemonGlobal.creditsPlayed = true
    pbBGMPlay(previousBGM)
  end

  # Check if the credits should be cancelled
  def cancel?
    if Input.trigger?(Input::C) && $PokemonGlobal.creditsPlayed
      $scene = Scene_Map.new
      pbBGMFade(1.0)
      return true
    end
    return false
  end

  # Checks if credits bitmap has reached its ending point
  def last?
    if @realOY > @credit_sprite.bitmap.height + @trim
      $scene = ($game_map) ? Scene_Map.new : nil
      pbBGMFade(2.0)
      return true
    end
    return false
  end

  def update
    @frameCounter += 1
    # Go to next slide
    if @frameCounter >= @framesPerBackground
      @frameCounter -= @framesPerBackground
      @bg_index += 1
      @bg_index = 0 if @bg_index >= @backgroundList.length
      @sprite.setBitmap("Graphics/Titles/"+@backgroundList[@bg_index])
    end
    return if cancel?
    return if last?
    @realOY += @oyChangePerFrame
    @credit_sprite.oy = @realOY
  end
end
