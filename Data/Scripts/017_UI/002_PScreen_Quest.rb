##=##===========================================================================
##=## Easy Questing System - made by M3rein
##=##===========================================================================
##=## Create your own quests starting from line 72. Be aware of the following:
##=## * Every quest should have a unique ID;
##=## * Every quest should be unique (at least one field has to be different);
##=## * The "Name" field can't be very long;
##=## * The "Desc" field can be quite long;
##=## * The "NPC" field is JUST a name;
##=## * The "Sprite" field is the name of the sprite in "Graphics/Characters";
##=## * The "Location" field is JUST a name;
##=## * The "Color" field is a SYMBOL (starts with ':'). List under "pbColor";
##=## * The "Time" field can be a random string for it to be "?????" in-game;
##=## * The "Completed" field can be pre-set, but is normally only changed in-game
##=##===========================================================================
class Quest
  attr_accessor :id
  attr_accessor :name
  attr_accessor :desc
  attr_accessor :npc
  attr_accessor :sprite
  attr_accessor :location
  attr_accessor :color
  attr_accessor :time
  attr_accessor :completed
  def initialize(id, name, desc, npc, sprite, location, color = :WHITE, time = Time.now, completed = false)
    self.id = id
    self.name = name
    self.desc = desc
    self.npc = npc
    self.sprite = sprite
    self.location = location
    self.color = pbColor(color)
    self.time = time
    self.completed = completed
  end
end

def pbColor(color)
  # Mix your own colors: http://www.rapidtables.com/web/color/RGB_Color.htm
  return Color.new(0,0,0)         if color == :BLACK
  return Color.new(255,115,115)   if color == :LIGHTRED
  return Color.new(245,11,11)     if color == :RED
  return Color.new(164,3,3)       if color == :DARKRED
  return Color.new(47,46,46)      if color == :DARKGREY
  return Color.new(100,92,92)     if color == :LIGHTGREY
  return Color.new(226,104,250)   if color == :PINK
  return Color.new(243,154,154)   if color == :PINKTWO
  return Color.new(255,160,50)    if color == :GOLD
  return Color.new(255,186,107)   if color == :LIGHTORANGE
  return Color.new(95,54,6)       if color == :BROWN
  return Color.new(122,76,24)     if color == :LIGHTBROWN
  return Color.new(255,246,152)   if color == :LIGHTYELLOW
  return Color.new(242,222,42)    if color == :YELLOW
  return Color.new(80,111,6)      if color == :DARKGREEN
  return Color.new(154,216,8)     if color == :GREEN
  return Color.new(197,252,70)    if color == :LIGHTGREEN
  return Color.new(74,146,91)     if color == :FADEDGREEN
  return Color.new(6,128,92)      if color == :DARKLIGHTBLUE
  return Color.new(18,235,170)    if color == :LIGHTBLUE
  return Color.new(139,247,215)   if color == :SUPERLIGHTBLUE
  return Color.new(35,203,255)    if color == :BLUE
  return Color.new(3,44,114)      if color == :DARKBLUE
  return Color.new(7,3,114)       if color == :SUPERDARKBLUE
  return Color.new(63,6,121)      if color == :DARKPURPLE
  return Color.new(113,16,209)    if color == :PURPLE
  return Color.new(219,183,37)    if color == :ORANGE
  return Color.new(255,255,255)
end

QUESTS = [
# Make sure you take into account all the information given at the top of this script.
# You don't have to give the Quest a color - :SUPERLIGHTBLUE in this example. It will default to White.
   Quest.new(1, "Catching a Slowpoke", "Catch a Slowpoke for Professor Poplar.", "Professor Poplar", "phone001", "Poplar's Lab", :WHITE),
   Quest.new(2, "Catching a Magikarp", "Catch a Magikarp for Professor Poplar.", "Professor Poplar", "phone001", "Poplar's Lab", :WHITE),
   Quest.new(3, "Artifact Hunt", "Help the assistant find an artifact in Route 2.", "Professor Poplar", "phone001", "Poplar's Lab", :WHITE),
   Quest.new(4, "Assistant in distress", "Find the lost assistant in the Polder Reserve.", "Professor Poplar", "phone001", "Poplar's Lab", :WHITE),
   Quest.new(5, "Magnetic Misschief", "Study the magnetic occurences on the Great Dam.", "Professor Poplar", "phone001", "Poplar's Lab", :WHITE),
   Quest.new(6, "Trouble at Bell Lake", "Assist Ranger Cade at Bell Lake.", "Pok??mon Rangers", "NPC 30", "Ranger Outpost", :GREEN),
   Quest.new(7, "Trouble in Lumishore", "Assist Ranger Huxley at Lumishore City.", "Pok??mon Rangers", "NPC 30", "Ranger Outpost", :GREEN),
   Quest.new(8, "Berry Support", "Gather 3 ORAN BERRIES for the Pok??mon Rangers.", "Pok??mon Rangers", "NPC 30", "Ranger Outpost", :GREEN),
   Quest.new(9, "Route 1 Invasion", "Defeat the Pok??mon Invasion on Route 1.", "Pok??mon Rangers", "NPC 30", "Ranger Outpost", :GREEN),
   Quest.new(10, "Pok??-Farm Pests", "Clear the Pok??mon Pests on Route 3.", "Pok??mon Rangers", "NPC 30", "Ranger Outpost", :GREEN),
   Quest.new(11, "Pesky Gulls", "Defeat the agressive Pelipper in Lumishore City.", "Pok??mon Rangers", "NPC 30", "Ranger Outpost", :GREEN),
   Quest.new(12, "Reserve Guardian", "Defeat the poacher in the Polder Reserve.", "Pok??mon Rangers", "NPC 30", "Ranger Outpost", :GREEN),
   Quest.new(13, "Bicycle Blockade", "Report to the Bicycle Store.", "Deliveryman", "NPC 19", "Route 2", :BLUE),
   Quest.new(14, "Egg Research", "Deliver the package to Professor Poplar.", "Chansey", "113", "Bell Town", :BLUE),
   Quest.new(15, "Milk Errand", "Buy MooMoo Milk and bring it to Mom.", "Mom", "NPC 28", "Pok??-Farm", :BLUE),
   Quest.new(16, "Assistant Tutorials", "Complete all the assistant's tutorials in Route 1, Bell Town and Route 2, then return to the lab for a reward from the assistant.", "Pok??mon Assistant", "trchar028", "Various Locations", :WHITE),
   Quest.new(17, "TUTORIAL: Wild Battles", "Listen to the explanation about wild pok??mon battles and participate in the practice battle.", "Pok??mon Assistant", "trchar028", "Various Locations", :WHITE),
   Quest.new(18, "TUTORIAL: Trainer Battles", "Listen to the explanation about Trainer Battles.", "Pok??mon Assistant", "trchar028", "Various Locations", :WHITE),
   Quest.new(19, "TUTORIAL: Towns", "Listen to the explanation about towns.", "Pok??mon Assistant", "trchar028", "Various Locations", :WHITE),
   Quest.new(20, "TUTORIAL: Caverns", "Listen to the explanation about caverns.", "Pok??mon Assistant", "trchar028", "Various Locations", :WHITE),
   Quest.new(21, "TUTORIAL: Pok??Gear", "Listen to the explanation about the Pok??Gear.", "Pok??mon Assistant", "trchar028", "Various Locations", :WHITE),
   Quest.new(22, "Urgent Delivery", "Bring the Pok??Medicine to Nurse Joy in Hedge Point.", "Nurse Joy", "NPC 16", "The Great Dam", :BLUE),
   Quest.new(23, "Lost in the Weald", "Find the Scyther who was lost in Hedge Weald.", "Wood Carver", "NPC 21", "Wood Carving Workshop", :BLUE),
   Quest.new(24, "Trudging through the snow", "Find the girl's Ice Skates in the forest near Yssel Lake.", "Ice Skater", "NPC 26", "Yssel Lake", :BLUE),
   Quest.new(25, "The proving grounds", "Find the falconer's glove in the fort ruins in Route 5.", "Master Falconer", "trchar031", "Falconry Guild", :BLUE),
   Quest.new(26, "Great Gears of Fire", "Bring the researcher in Sulfur City a Fire stone.","Researcher","NPC 15","Sulfur City", :BLUE),
   Quest.new(27, "Ranger Delivery: Milldam", "Bring the supplies to the Milldam Rangers.","Pok??mon Rangers","NPC 30","Bell Town", :GREEN),
   Quest.new(28, "Ranger Delivery: Lumishore", "Bring the supplies to the Lumishore Rangers.","Pok??mon Rangers","NPC 30","Bell Town", :GREEN),
   Quest.new(29, "Ranger Delivery: Tidal Town", "Bring the supplies to the Tidal Rangers.","Pok??mon Rangers","NPC 30","Milldam", :GREEN),
   Quest.new(30, "Ranger Delivery: Orange Burg", "Bring the supplies to the Orange Burg Rangers.","Pok??mon Rangers","NPC 30","Milldam", :GREEN),
   Quest.new(31, "Ranger Delivery: Sulfur City", "Bring the supplies to the Sulfur City Rangers.","Pok??mon Rangers","NPC 30","Orange Burg", :GREEN),
   Quest.new(32, "Ranger Delivery: Industrielle", "Bring the supplies to the Industrielle Rangers.","Pok??mon Rangers","NPC 30","Sulfur City", :GREEN),
   Quest.new(33, "Flowers for Pokemon", "Place the flowers by the war memorial on Route 2.","Old man","NPC 18","Bell Town", :BLUE),
   Quest.new(34, "Flowers for Pokemon: Part 2", "Place the flower by the grave in the Hedge Weald.","Dead Pok??mon","200","Trench Grove", :BLUE),
   Quest.new(35, "River Blockage", "Clear the river in Hedge Weald.","Pok??mon Rangers","NPC 30","Ranger Outpost", :GREEN),
   Quest.new(36, "Unown Language", "Examine the mysterious walls in the Bell Town Ruins, then report back to the assistant or prof Poplar.", "Professor Poplar", "phone001", "Poplar's Lab", :WHITE),
   ]


class PokeBattle_Trainer
  attr_accessor :quests
end

def pbCompletedQuest?(id)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for i in 0...$Trainer.quests.size
    return true if $Trainer.quests[i].completed && $Trainer.quests[i].id == id
  end
  return false
end

def pbQuestlog
  Questlog.new
end

def pbAddQuest(id)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in QUESTS
    $Trainer.quests << q if q.id == id
  end
end

def pbDeleteQuest(id)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in $Trainer.quests
    $Trainer.quests.delete(q) if q.id == id
  end
end

def pbSetQuest(id, completed)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in $Trainer.quests
    q.completed = completed if q.id == id
  end
end

def pbSetQuestName(id, name)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in $Trainer.quests
    q.name = name if q.id == id
  end
end

def pbSetQuestDesc(id, desc)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in $Trainer.quests
    q.desc = desc if q.id == id
  end
end

def pbSetQuestNPC(id, npc)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in $Trainer.quests
    q.npc = npc if q.id == id
  end
end

def pbSetQuestNPCSprite(id, sprite)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in $Trainer.quests
    q.sprite = sprite if q.id == id
  end
end

def pbSetQuestLocation(id, location)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in $Trainer.quests
    q.location = location if q.id == id
  end
end

def pbSetQuestColor(id, color)
  $Trainer.quests = [] if $Trainer.quests.class == NilClass
  for q in $Trainer.quests
    q.color = pbColor(color) if q.id == id
  end
end

class QuestSprite < IconSprite
  attr_accessor :quest
end

class Questlog
  def initialize
    $Trainer.quests = [] if $Trainer.quests.class == NilClass
    @page = 0
    @sel_one = 0
    @sel_two = 0
    @scene = 0
    @mode = 0
    @box = 0
    @completed = []
    @ongoing = []
    for q in $Trainer.quests
      @ongoing << q if !q.completed
      @completed << q if q.completed
    end
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    @sprites["main"] = BitmapSprite.new(Graphics.width, Graphics.height, @viewport)
    @sprites["main"].z = 1
    @sprites["main"].opacity = 0
    @main = @sprites["main"].bitmap
    pbSetSystemFont(@main)
    pbDrawOutlineText(@main,0,2-178,512,384,"Task Reports",Color.new(255,255,255),Color.new(0,0,0),1)
    
    @sprites["bg0"] = IconSprite.new(0, 0, @viewport)
    @sprites["bg0"].setBitmap("Graphics/Pictures/pokegearbg")
    @sprites["bg0"].opacity = 0
    
    for i in 0..1
      @sprites["btn#{i}"] = IconSprite.new(0, 0, @viewport)
      @sprites["btn#{i}"].setBitmap("Graphics/Pictures/questBtn")
      @sprites["btn#{i}"].x = 84
      @sprites["btn#{i}"].y = 130 + 56 * i
      @sprites["btn#{i}"].src_rect.height = (@sprites["btn#{i}"].bitmap.height / 2).round
      @sprites["btn#{i}"].src_rect.y = i == 0 ? (@sprites["btn#{i}"].bitmap.height / 2).round : 0
      @sprites["btn#{i}"].opacity = 0
    end
    pbDrawOutlineText(@main,0,142-178,512,384,"Ongoing: " + @ongoing.size.to_s,Color.new(255,255,255),Color.new(0,0,0),1)
    pbDrawOutlineText(@main,0,198-178,512,384,"Completed: " + @completed.size.to_s,Color.new(255,255,255),Color.new(0,0,0),1)

    12.times do |i|
      Graphics.update
      @sprites["bg0"].opacity += 32 if i < 8
      @sprites["btn0"].opacity += 32 if i > 3
      @sprites["btn1"].opacity += 32 if i > 3
      @sprites["main"].opacity += 64 if i > 7
    end
    pbUpdate
  end
  
  def pbUpdate
    @frame = 0
    loop do
      @frame += 1
      Graphics.update
      Input.update
      if @scene == 0
        break if Input.trigger?(Input::B)
        pbList(@sel_one) if Input.trigger?(Input::C)
        pbSwitch(:DOWN) if Input.trigger?(Input::DOWN)
        pbSwitch(:UP) if Input.trigger?(Input::UP)
      end
      if @scene == 1
        pbMain if Input.trigger?(Input::B)
        pbMove(:DOWN) if Input.trigger?(Input::DOWN)
        pbMove(:UP) if Input.trigger?(Input::UP)
        pbLoad(0) if Input.trigger?(Input::C)
	pbArrows
      end
      if @scene == 2
        pbList(@sel_one) if Input.trigger?(Input::B)
        pbChar if @frame == 6 || @frame == 12 || @frame == 18
        pbLoad(1) if Input.trigger?(Input::RIGHT) && @page == 0
        pbLoad(2) if Input.trigger?(Input::LEFT) && @page == 1
      end
      @frame = 0 if @frame == 18
    end
    pbEnd
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
    pbWait(1)
  end
	
  def pbArrows
    if @frame == 2 || @frame == 4 || @frame == 14 || @frame == 16
      @sprites["up"].y -= 1 rescue nil
      @sprites["down"].y -= 1 rescue nil
    elsif @frame == 6 || @frame == 8 || @frame == 10 || @frame == 12
      @sprites["up"].y += 1 rescue nil
       @sprites["down"].y += 1 rescue nil
    end
  end
	
  def pbLoad(page)
    return if @mode == 0 ? @ongoing.size == 0 : @completed.size == 0
    quest = @mode == 0 ? @ongoing[@sel_two] : @completed[@sel_two]
    pbWait(1)
    if page == 0
      @scene = 2
      @sprites["bg1"] = IconSprite.new(0, 0, @viewport)
      @sprites["bg1"].setBitmap("Graphics/Pictures/questPage1")
      @sprites["bg1"].opacity = 0
      @sprites["pager"] = IconSprite.new(0, 0, @viewport)
      @sprites["pager"].setBitmap("Graphics/Pictures/questPager")
      @sprites["pager"].x = 442
      @sprites["pager"].y = 3
      @sprites["pager"].z = 1
      @sprites["pager"].opacity = 0
      8.times do
        Graphics.update
	@sprites["up"].opacity -= 32
	@sprites["down"].opacity -= 32
        @sprites["main"].opacity -= 32
        @sprites["bg1"].opacity += 32
        @sprites["pager"].opacity += 32
        @sprites["char"].opacity -= 32 rescue nil
        for i in 0...@ongoing.size
	  break if i > 5
          @sprites["ongoing#{i}"].opacity -= 32 rescue nil
        end
        for i in 0...@completed.size
	  break if i > 5
          @sprites["completed#{i}"].opacity -= 32 rescue nil
        end
      end
      @sprites["up"].dispose
      @sprites["down"].dispose
      @sprites["char"] = IconSprite.new(0, 0, @viewport)
      @sprites["char"].setBitmap("Graphics/Characters/#{quest.sprite}")
      @sprites["char"].x = 62
      @sprites["char"].y = 130
      @sprites["char"].src_rect.height = (@sprites["char"].bitmap.height / 4).round
      @sprites["char"].src_rect.width = (@sprites["char"].bitmap.width / 4).round
      @sprites["char"].opacity = 0
      @main.clear
      @text.clear rescue nil
      @text2.clear rescue nil
      drawTextExMulti(@main,188,54,318,8,quest.desc,Color.new(255,255,255),Color.new(0,0,0))
      pbDrawOutlineText(@main,188,162,512,384,"From " + quest.npc,Color.new(255,172,115),Color.new(0,0,0))
      pbDrawOutlineText(@main,10,-178,512,384,quest.name,quest.color,Color.new(0,0,0))
      if !quest.completed
        pbDrawOutlineText(@main,8,136,512,384,"Not Completed",pbColor(:LIGHTRED),Color.new(0,0,0))
      else
        pbDrawOutlineText(@main,8,136,512,384,"Completed",pbColor(:LIGHTBLUE),Color.new(0,0,0))
      end
      10.times do |i|
        Graphics.update
        @sprites["main"].opacity += 32
        @sprites["char"].opacity += 32 if i > 1
      end
    elsif page == 1
      @page = 1
      @sprites["bg2"] = IconSprite.new(0, 0, @viewport)
      @sprites["bg2"].setBitmap("Graphics/Pictures/questPage1")
      @sprites["bg2"].x = 512
      @sprites["pager2"] = IconSprite.new(0, 0, @viewport)
      @sprites["pager2"].setBitmap("Graphics/Pictures/questPager")
      @sprites["pager2"].x = 474 + 512
      @sprites["pager2"].y = 3
      @sprites["pager2"].z = 1
      @sprites["char2"].dispose rescue nil
      @sprites["char2"] = IconSprite.new(0, 0, @viewport)
      @sprites["char2"].setBitmap("Graphics/Characters/#{quest.sprite}")
      @sprites["char2"].x = 62 + 512
      @sprites["char2"].y = 130
      @sprites["char2"].z = 1
      @sprites["char2"].src_rect.height = (@sprites["char2"].bitmap.height / 4).round
      @sprites["char2"].src_rect.width = (@sprites["char2"].bitmap.width / 4).round
      @sprites["text2"] = IconSprite.new(@viewport)
      @sprites["text2"].bitmap = Bitmap.new(Graphics.width,Graphics.height)
      @text2 = @sprites["text2"].bitmap
      pbSetSystemFont(@text2)
      pbDrawOutlineText(@text2,188,-122,512,384,"Task received in:",Color.new(255,255,255),Color.new(0,0,0))
      pbDrawOutlineText(@text2,188,-94,512,384,quest.location,Color.new(255,172,115),Color.new(0,0,0))
      pbDrawOutlineText(@text2,188,-62,512,384,"Task received at:",Color.new(255,255,255),Color.new(0,0,0))
      time = quest.time.to_s
      txt = time.split(' ')[1] + " " + time.split(' ')[2] + ", " + time.split(' ')[3].split(':')[0] + ":" + time.split(' ')[3].split(':')[1] rescue "?????"
      pbDrawOutlineText(@text2,188,-36,512,384,txt,Color.new(255,172,115),Color.new(0,0,0))
      pbDrawOutlineText(@text2,188,-4,512,384,"Task received from:",Color.new(255,255,255),Color.new(0,0,0))
      pbDrawOutlineText(@text2,188,22,512,384,quest.npc,Color.new(255,172,115),Color.new(0,0,0))
      pbDrawOutlineText(@text2,188,162,512,384,"From " + quest.npc,Color.new(255,172,115),Color.new(0,0,0))
      pbDrawOutlineText(@text2,10,-178,512,384,quest.name,quest.color,Color.new(0,0,0))
      if !quest.completed
        pbDrawOutlineText(@text2,8,136,512,384,"Not Completed",pbColor(:LIGHTRED),Color.new(0,0,0))
      else
        pbDrawOutlineText(@text2,8,136,512,384,"Completed",pbColor(:LIGHTBLUE),Color.new(0,0,0))
      end
      @sprites["text2"].x = 512
      16.times do
        Graphics.update
        @sprites["bg1"].x -= (@sprites["bg1"].x + 526) * 0.2
        @sprites["pager"].x -= (@sprites["pager"].x + 526) * 0.2 rescue nil
        @sprites["char"].x -= (@sprites["char"].x + 526) * 0.2 rescue nil
        @sprites["main"].x -= (@sprites["main"].x + 526) * 0.2
        @sprites["text"].x -= (@sprites["text"].x + 526) * 0.2 rescue nil
        @sprites["bg2"].x -= (@sprites["bg2"].x + 14) * 0.2
        @sprites["pager2"].x -= (@sprites["pager2"].x - 459) * 0.2
        @sprites["text2"].x -= (@sprites["text2"].x + 14) * 0.2
        @sprites["char2"].x -= (@sprites["char2"].x - 47) * 0.2
      end
      @sprites["main"].x = 0
      @main.clear
    else
      @page = 0
      @sprites["bg1"] = IconSprite.new(0, 0, @viewport)
      @sprites["bg1"].setBitmap("Graphics/Pictures/questPage1")
      @sprites["bg1"].x = -512
      @sprites["pager"] = IconSprite.new(0, 0, @viewport)
      @sprites["pager"].setBitmap("Graphics/Pictures/questPager")
      @sprites["pager"].x = 442 - 512
      @sprites["pager"].y = 3
      @sprites["pager"].z = 1
      @sprites["text"] = IconSprite.new(@viewport)
      @sprites["text"].bitmap = Bitmap.new(Graphics.width,Graphics.height)
      @text = @sprites["text"].bitmap
      pbSetSystemFont(@text)
      @sprites["char"].dispose rescue nil
      @sprites["char"] = IconSprite.new(0, 0, @viewport)
      @sprites["char"].setBitmap("Graphics/Characters/#{quest.sprite}")
      @sprites["char"].x = 62 - 512
      @sprites["char"].y = 130
      @sprites["char"].z = 1
      @sprites["char"].src_rect.height = (@sprites["char"].bitmap.height / 4).round
      @sprites["char"].src_rect.width = (@sprites["char"].bitmap.width / 4).round
      drawTextExMulti(@text,188,54,318,8,quest.desc,Color.new(255,255,255),Color.new(0,0,0))
      pbDrawOutlineText(@text,188,162,512,384,"From " + quest.npc,Color.new(255,172,115),Color.new(0,0,0))
      pbDrawOutlineText(@text,10,-178,512,384,quest.name,quest.color,Color.new(0,0,0))
      if !quest.completed
        pbDrawOutlineText(@text,8,136,512,384,"Not Completed",pbColor(:LIGHTRED),Color.new(0,0,0))
      else
        pbDrawOutlineText(@text,8,136,512,384,"Completed",pbColor(:LIGHTBLUE),Color.new(0,0,0))
      end
      @sprites["text"].x = -512
      16.times do
        Graphics.update
        @sprites["bg1"].x -= (@sprites["bg1"].x - 14) * 0.2
        @sprites["pager"].x -= (@sprites["pager"].x - 457) * 0.2
        @sprites["bg2"].x -= (@sprites["bg2"].x - 526) * 0.2
        @sprites["pager2"].x -= (@sprites["pager2"].x - 526) * 0.2
        @sprites["char2"].x -= (@sprites["char2"].x - 526) * 0.2
        @sprites["text2"].x -= (@sprites["text2"].x - 526) * 0.2
        @sprites["text"].x -= (@sprites["text"].x - 15) * 0.2
        @sprites["char"].x -= (@sprites["char"].x - 76) * 0.2
      end
    end
  end
  
  def pbChar
    @sprites["char"].src_rect.x += (@sprites["char"].bitmap.width / 4).round rescue nil
    @sprites["char"].src_rect.x = 0 if @sprites["char"].src_rect.x >= @sprites["char"].bitmap.width rescue nil
    @sprites["char2"].src_rect.x += (@sprites["char2"].bitmap.width / 4).round rescue nil
    @sprites["char2"].src_rect.x = 0 if @sprites["char2"].src_rect.x >= @sprites["char2"].bitmap.width rescue nil
  end
  
  def pbMain
    pbWait(1)
    12.times do |i|
      Graphics.update
      @sprites["main"].opacity -= 32 rescue nil
      @sprites["bg0"].opacity += 32 if @sprites["bg0"].opacity < 255
      @sprites["bg1"].opacity -= 32 rescue nil if i > 3
      @sprites["bg2"].opacity -= 32 rescue nil if i > 3
      @sprites["pager"].opacity -= 32 rescue nil if i > 3
      @sprites["pager2"].opacity -= 32 rescue nil if i > 3
      @sprites["char"].opacity -= 32 rescue nil
      @sprites["char2"].opacity -= 32 rescue nil
      @sprites["text"].opacity -= 32 rescue nil
      @sprites["up"].opacity -= 32
      @sprites["down"].opacity -= 32
      for j in 0...@ongoing.size
        @sprites["ongoing#{j}"].opacity -= 32 rescue nil
      end
      for j in 0...@completed.size
        @sprites["completed#{j}"].opacity -= 32 rescue nil
      end
    end
    @sprites["up"].dispose
    @sprites["down"].dispose
    @main.clear
    @text.clear rescue nil
    @text2.clear rescue nil
    @sel_two = 0
    @scene = 0
    pbDrawOutlineText(@main,0,2-178,512,384,"Task Log",Color.new(255,255,255),Color.new(0,0,0),1)
    pbDrawOutlineText(@main,0,142-178,512,384,"Ongoing: " + @ongoing.size.to_s,Color.new(255,255,255),Color.new(0,0,0),1)
    pbDrawOutlineText(@main,0,198-178,512,384,"Completed: " + @completed.size.to_s,Color.new(255,255,255),Color.new(0,0,0),1)
    12.times do |i|
      Graphics.update
      @sprites["bg0"].opacity += 32 if i < 8
      @sprites["btn0"].opacity += 32 if i > 3
      @sprites["btn1"].opacity += 32 if i > 3
      @sprites["main"].opacity += 48 if i > 5
    end
  end
  
  def pbSwitch(dir)
    if dir == :DOWN
      return if @sel_one == 1
      @sprites["btn#{@sel_one}"].src_rect.y = 0
      @sel_one += 1
      @sprites["btn#{@sel_one}"].src_rect.y = (@sprites["btn#{@sel_one}"].bitmap.height / 2).round
    else
      return if @sel_one == 0
      @sprites["btn#{@sel_one}"].src_rect.y = 0
      @sel_one -= 1
      @sprites["btn#{@sel_one}"].src_rect.y = (@sprites["btn#{@sel_one}"].bitmap.height / 2).round
    end
  end
  
  def pbMove(dir)
    pbWait(1)
    if dir == :DOWN
      return if @sel_two == @ongoing.size - 1 && @mode == 0
      return if @sel_two == @completed.size - 1 && @mode == 1
      return if @ongoing.size == 0 && @mode == 0
      return if @completed.size == 0 && @mode == 1
      @sprites["ongoing#{@box}"].src_rect.y = 0 if @mode == 0
      @sprites["completed#{@box}"].src_rect.y = 0 if @mode == 1
      @sel_two += 1
      @box += 1
      @box = 5 if @box > 5
      @sprites["ongoing#{@box}"].src_rect.y = (@sprites["ongoing#{@box}"].bitmap.height / 2).round if @mode == 0
      @sprites["completed#{@box}"].src_rect.y = (@sprites["completed#{@box}"].bitmap.height / 2).round if @mode == 1
      if @box == 5
	@main.clear
	if @mode == 0
	  for i in 0...@ongoing.size
	    break if i > 5
	    j = (i==0 ? -5 : (i==1 ? -4 : (i==2 ? -3 : (i==3 ? -2 : (i==4 ? -1 : 0)))))
	    @sprites["ongoing#{i}"].quest = @ongoing[@sel_two+j]
	    pbDrawOutlineText(@main,11,-124+52*i,512,384,@ongoing[@sel_two+j].name,@ongoing[@sel_two+j].color,Color.new(0,0,0),1)
	  end
	  if @sprites["ongoing0"].quest != @ongoing[0]
	     @sprites["up"].visible = true
	  else
	     @sprites["up"].visible = false
	  end
	  if @sprites["ongoing5"].quest != @ongoing[@ongoing.size - 1]
	    @sprites["down"].visible = true
	  else
	    @sprites["down"].visible = false
	  end
	  pbDrawOutlineText(@main,0,2-178,512,384,"Ongoing Tasks",Color.new(255,255,255),Color.new(0,0,0),1)
	else
	  for i in 0...@completed.size
	    break if i > 5
	    j = (i==0 ? -5 : (i==1 ? -4 : (i==2 ? -3 : (i==3 ? -2 : (i==4 ? -1 : 0)))))
	    @sprites["completed#{i}"].quest = @completed[@sel_two+j]
	    pbDrawOutlineText(@main,11,-124+52*i,512,384,@completed[@sel_two+j].name,@completed[@sel_two+j].color,Color.new(0,0,0),1)
	  end
	  if @sprites["completed0"].quest != @completed[0]
	    @sprites["up"].visible = true
	  else
	    @sprites["up"].visible = false
	  end
	  if @sprites["completed5"].quest != @completed[@completed.size - 1]
	    @sprites["down"].visible = true
	  else
	    @sprites["down"].visible = false
	  end
	  pbDrawOutlineText(@main,0,2-178,512,384,"Completed Tasks",Color.new(255,255,255),Color.new(0,0,0),1)
	end
      end
    else
      return if @sel_two == 0
      return if @ongoing.size == 0 && @mode == 0
      return if @completed.size == 0 && @mode == 1
      @sprites["ongoing#{@box}"].src_rect.y = 0 if @mode == 0
      @sprites["completed#{@box}"].src_rect.y = 0 if @mode == 1
      @sel_two -= 1
      @box -= 1
      @box = 0 if @box < 0
      @sprites["ongoing#{@box}"].src_rect.y = (@sprites["ongoing#{@box}"].bitmap.height / 2).round if @mode == 0
      @sprites["completed#{@box}"].src_rect.y = (@sprites["completed#{@box}"].bitmap.height / 2).round if @mode == 1
      if @box == 0
        @main.clear
	if @mode == 0
	  for i in 0...@ongoing.size
	    break if i > 5
	    @sprites["ongoing#{i}"].quest = @ongoing[@sel_two+i]
	    pbDrawOutlineText(@main,11,-124+52*i,512,384,@ongoing[@sel_two+i].name,@ongoing[@sel_two+i].color,Color.new(0,0,0),1)
	  end
	  if @sprites["ongoing5"].quest != @ongoing[0]
	    @sprites["up"].visible = true
	  else
	    @sprites["up"].visible = false
	  end
	  if @sprites["ongoing5"].quest != @ongoing[@ongoing.size - 1]
	    @sprites["down"].visible = true
	  else
	    @sprites["down"].visible = false
	  end
	  pbDrawOutlineText(@main,0,2-178,512,384,"Ongoing Tasks",Color.new(255,255,255),Color.new(0,0,0),1)
	else
	  for i in 0...@completed.size
	    break if i > 5
	    @sprites["completed#{i}"].quest = @completed[@sel_two+i]
	    pbDrawOutlineText(@main,11,-124+52*i,512,384,@completed[@sel_two+i].name,@completed[@sel_two+i].color,Color.new(0,0,0),1)
	  end
	  if @sprites["completed0"].quest != @completed[0]
	    @sprites["up"].visible = true
	  else
	    @sprites["up"].visible = false
	  end
	  if @sprites["completed5"].quest != @completed[@completed.size - 1]
	    @sprites["down"].visible = true
	  else
	    @sprites["down"].visible = false
	  end
	  pbDrawOutlineText(@main,0,2-178,512,384,"Completed Tasks",Color.new(255,255,255),Color.new(0,0,0),1)
	end
      end
    end
  end
  
  def pbList(id)
    pbWait(1)
    @sel_two = 0
    @page = 0
    @scene = 1
    @mode = id
    @box = 0
    @sprites["up"] = IconSprite.new(0, 0, @viewport)
    @sprites["up"].setBitmap("Graphics/Pictures/questArrow")
    @sprites["up"].zoom_x = 1.25
    @sprites["up"].zoom_y = 1.25
    @sprites["up"].x = Graphics.width / 2
    @sprites["up"].y = 36
    @sprites["up"].z = 2
    @sprites["up"].visible = false
    @sprites["down"] = IconSprite.new(0, 0, @viewport)
    @sprites["down"].setBitmap("Graphics/Pictures/questArrow")
    @sprites["down"].zoom_x = 1.25
    @sprites["down"].zoom_y = 1.25
    @sprites["down"].x = Graphics.width / 2 + 21
    @sprites["down"].y = 360
    @sprites["down"].z = 2
    @sprites["down"].angle = 180
    @sprites["down"].visible = @mode == 0 ? @ongoing.size > 6 : @completed.size > 6
    @sprites["down"].opacity = 0
    10.times do |i|
      Graphics.update
      @sprites["btn0"].opacity -= 32 if i > 1
      @sprites["btn1"].opacity -= 32 if i > 1
      @sprites["main"].opacity -= 32 if i > 1
      @sprites["bg1"].opacity -= 32 rescue nil if i > 1
      @sprites["bg2"].opacity -= 32 rescue nil if i > 1
      @sprites["pager"].opacity -= 32 rescue nil if i > 1
      @sprites["pager2"].opacity -= 32 rescue nil if i > 1
      @sprites["char"].opacity -= 32 rescue nil
      @sprites["char2"].opacity -= 32 rescue nil
      @sprites["text"].opacity -= 32 rescue nil if i > 1
      @sprites["text2"].opacity -= 32 rescue nil if i > 1
    end
    @main.clear
    @text.clear rescue nil 
    @text2.clear rescue nil
    if id == 0
      for i in 0...@ongoing.size
	break if i > 5
        @sprites["ongoing#{i}"] = QuestSprite.new(0, 0, @viewport)
        @sprites["ongoing#{i}"].setBitmap("Graphics/Pictures/questBtn")
	@sprites["ongoing#{i}"].quest = @ongoing[i]
        @sprites["ongoing#{i}"].x = 94
        @sprites["ongoing#{i}"].y = 42 + 52 * i
        @sprites["ongoing#{i}"].src_rect.height = (@sprites["ongoing#{i}"].bitmap.height / 2).round
        @sprites["ongoing#{i}"].src_rect.y = (@sprites["ongoing#{i}"].bitmap.height / 2).round if i == @sel_two
        @sprites["ongoing#{i}"].opacity = 0
        pbDrawOutlineText(@main,11,-124+52*i,512,384,@ongoing[i].name,@ongoing[i].color,Color.new(0,0,0),1)
      end
      pbDrawOutlineText(@main,0,0,512,384,"No ongoing Tasks",pbColor(:WHITE),pbColor(:BLACK),1) if @ongoing.size == 0
      pbDrawOutlineText(@main,0,2-178,512,384,"Ongoing Tasks",Color.new(255,255,255),Color.new(0,0,0),1)
      12.times do |i|
        Graphics.update
        @sprites["main"].opacity += 32 if i < 8
        for j in 0...@ongoing.size
	  break if j > 5
          @sprites["ongoing#{j}"].opacity += 32 if i > 3
        end
      end
    elsif id == 1
      for i in 0...@completed.size
	break if i > 5
        @sprites["completed#{i}"] = QuestSprite.new(0, 0, @viewport)
        @sprites["completed#{i}"].setBitmap("Graphics/Pictures/questBtn")
        @sprites["completed#{i}"].x = 94
        @sprites["completed#{i}"].y = 42 + 52 * i
        @sprites["completed#{i}"].src_rect.height = (@sprites["completed#{i}"].bitmap.height / 2).round
        @sprites["completed#{i}"].src_rect.y = (@sprites["completed#{i}"].bitmap.height / 2).round if i == @sel_two
        @sprites["completed#{i}"].opacity = 0
        pbDrawOutlineText(@main,11,-124+52*i,512,384,@completed[i].name,@completed[i].color,Color.new(0,0,0),1)
      end
      pbDrawOutlineText(@main,0,0,512,384,"No completed Tasks",pbColor(:WHITE),pbColor(:BLACK),1) if @completed.size == 0
      pbDrawOutlineText(@main,0,2-178,512,384,"Completed Tasks",Color.new(255,255,255),Color.new(0,0,0),1)
      12.times do |i|
        Graphics.update
        @sprites["main"].opacity += 32 if i < 8
	@sprites["down"].opacity += 32 if i > 3
        for j in 0...@completed.size
	  break if j > 5
          @sprites["completed#{j}"].opacity += 32 if i > 3
        end
      end
    end
  end
  
  def pbEnd
    12.times do |i|
      Graphics.update
      @sprites["bg0"].opacity -= 32 if i > 3
      @sprites["btn0"].opacity -= 32
      @sprites["btn1"].opacity -= 32
      @sprites["main"].opacity -= 32
      @sprites["char"].opacity -= 40 rescue nil
      @sprites["char2"].opacity -= 40 rescue nil
    end
  end
end