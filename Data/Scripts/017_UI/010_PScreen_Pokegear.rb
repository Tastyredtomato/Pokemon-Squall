class PokegearButton < SpriteWrapper
  attr_reader :index
  attr_reader :name
  attr_reader :selected

  def initialize(command,x,y,viewport=nil)
    super(viewport)
    @image = command[0]
    @name  = command[1]
    @selected = false
    if $Trainer.isFemale? && pbResolveBitmap(sprintf("Graphics/Pictures/Pokegear/icon_button_f"))
      @button = AnimatedBitmap.new("Graphics/Pictures/Pokegear/icon_button_f")
    else
      @button = AnimatedBitmap.new("Graphics/Pictures/Pokegear/icon_button")
    end
    @contents = BitmapWrapper.new(@button.width,@button.height)
    self.bitmap = @contents
    self.x = x
    self.y = y
    pbSetSystemFont(self.bitmap)
    refresh
  end

  def dispose
    @button.dispose
    @contents.dispose
    super
  end

  def selected=(val)
    oldsel = @selected
    @selected = val
    refresh if oldsel!=val
  end

  def refresh
    self.bitmap.clear
    rect = Rect.new(0,0,@button.width,@button.height/2)
    rect.y = @button.height/2 if @selected
    self.bitmap.blt(0,0,@button.bitmap,rect)
    textpos = [
       [@name,self.bitmap.width/2,10,2,Color.new(248,248,248),Color.new(40,40,40)],
    ]
    pbDrawTextPositions(self.bitmap,textpos)
    imagepos = [
       [sprintf("Graphics/Pictures/Pokegear/icon_"+@image),18,10,0,0,-1,-1],
    ]
    pbDrawImagePositions(self.bitmap,imagepos)
  end
end



class PokemonPokegear_Scene
  def pbUpdate
    for i in 0...@commands.length
      @sprites["button#{i}"].selected = (i==@index)
    end
    pbUpdateSpriteHash(@sprites)
  end

  def pbStartScene(commands)
    @commands = commands
    @index = 0
    @viewport = Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    @sprites["background"] = IconSprite.new(0,0,@viewport)
    if $Trainer.isFemale? && pbResolveBitmap(sprintf("Graphics/Pictures/Pokegear/bg_f"))
      @sprites["background"].setBitmap("Graphics/Pictures/Pokegear/bg_f")
    else
      @sprites["background"].setBitmap("Graphics/Pictures/Pokegear/bg")
    end
    for i in 0...@commands.length
      y = 196 - (@commands.length*24) + (i*48)
      @sprites["button#{i}"] = PokegearButton.new(@commands[i],118,y,@viewport)
    end
    pbFadeInAndShow(@sprites) { pbUpdate }
  end

  def pbScene
    ret = -1
    loop do
      Graphics.update
      Input.update
      pbUpdate
      if Input.trigger?(Input::B)
        break
      elsif Input.trigger?(Input::C)
        ret = @index
        break
      elsif Input.trigger?(Input::UP)
        @index -= 1
        @index = @commands.length-1 if @index<0
        pbPlayCursorSE if @commands.length>1
      elsif Input.trigger?(Input::DOWN)
        @index += 1
        @index = 0 if @index>=@commands.length
        pbPlayCursorSE if @commands.length>1
      end
    end
    return ret
  end

  def pbEndScene
    pbFadeOutAndHide(@sprites) { pbUpdate }
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
end



class PokemonPokegearScreen
  def initialize(scene)
    @scene = scene
  end

  def pbStartScreen
    commands = []
    cmdMap     = -1
    cmdPhone   = -1
    cmdJukebox = -1
    cmdTracker = -1
    cmdDaycare = -1
    cmdUnownDex = -1
    commands[cmdMap = commands.length]     = ["map",_INTL("Map")]
    if $PokemonGlobal.phoneNumbers && $PokemonGlobal.phoneNumbers.length>0
      commands[cmdPhone = commands.length] = ["phone",_INTL("Phone")]
    end
    if $game_switches[72] == true
      commands[cmdTracker = commands.length]     = ["tracker",_INTL("Pok??Tracker")]
    end
    if $game_switches[73] == true
      commands[cmdDaycare = commands.length]     = ["daycare",_INTL("Daycare")]
    end
    if $game_switches[92] == true
    commands[cmdUnownDex = commands.length]     = ["unown",_INTL("Unown Report")]
    end
    commands[cmdJukebox = commands.length] = ["jukebox",_INTL("Jukebox")]
    @scene.pbStartScene(commands)
    loop do
      cmd = @scene.pbScene
      if cmd<0
        pbPlayCancelSE
        break
      elsif cmdMap>=0 && cmd==cmdMap
        pbPlayDecisionSE
        pbShowMap(-1,false)
      elsif cmdPhone>=0 && cmd==cmdPhone
        pbPlayDecisionSE
        pbFadeOutIn(99999){
          PokemonPhoneScene.new.start
        }
      elsif cmdJukebox>=0 && cmd==cmdJukebox
        pbPlayDecisionSE
        pbFadeOutIn(99999){
          scene = PokemonJukebox_Scene.new
          screen = PokemonJukeboxScreen.new(scene)
          screen.pbStartScreen
        }
      elsif cmdTracker>=0 && cmd==cmdTracker
        pbPlayDecisionSE
        pbFadeOutIn(99999){
         scene = PokemonTracker_Scene.new
          screen = PokemonTrackerScreen.new(scene)
          screen.pbStartScreen
        }
      elsif cmdDaycare>=0 && cmd==cmdDaycare
        pbPlayDecisionSE
        pbFadeOutIn(99999){
         scene=DayCareCheckerScene.new
         screen=DayCareChecker.new(scene)
         screen.startScreen
        }
      elsif cmdUnownDex>=0 && cmd==cmdUnownDex
        pbPlayDecisionSE
        pbFadeOutIn(99999){
         scene=UnownDex_Scene.new
         screen=UnownDexScreen.new(scene)
         screen.pbStartScreen
        }
      end
    end
    @scene.pbEndScene
  end
end