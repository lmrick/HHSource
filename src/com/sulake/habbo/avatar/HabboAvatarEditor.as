package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.avatar.common.class_3319;
   import com.sulake.habbo.avatar.effects.EffectsModel;
   import com.sulake.habbo.avatar.events.AvatarUpdateEvent;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.generic.BodyModel;
   import com.sulake.habbo.avatar.head.HeadModel;
   import com.sulake.habbo.avatar.hotlooks.HotLooksModel;
   import com.sulake.habbo.avatar.legs.LegsModel;
   import com.sulake.habbo.avatar.nft.NftAvatarsModel;
   import com.sulake.habbo.avatar.structure.class_3143;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.figure.class_3195;
   import com.sulake.habbo.avatar.structure.figure.class_3220;
   import com.sulake.habbo.avatar.torso.TorsoModel;
   import com.sulake.habbo.avatar.wardrobe.NftOutfit;
   import com.sulake.habbo.avatar.wardrobe.WardrobeModel;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import package_109.class_639;
   import package_63.class_900;
   import package_77.SaveUserNftWardrobeMessageComposer;
   import package_77.class_717;
   
   public class HabboAvatarEditor
   {
      
      public static const DEFAULT_MALE_FIGURE:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
      
      public static const DEFAULT_FEMALE_FIGURE:String = "hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68";
      
      private static const MAX_COLOR_LAYERS:int = 2;
       
      
      private var var_3728:uint;
      
      private var var_437:com.sulake.habbo.avatar.HabboAvatarEditorManager;
      
      private var var_2566:class_3143;
      
      private var var_1430:com.sulake.habbo.avatar.AvatarEditorView;
      
      private var var_1420:Boolean = false;
      
      private var var_1298:class_24;
      
      private var var_2249:class_24;
      
      private var var_2147:Dictionary;
      
      private var var_122:String = "M";
      
      private var _figureString:String;
      
      private var var_2513:com.sulake.habbo.avatar.class_3241 = null;
      
      private var var_3364:Boolean = false;
      
      private var var_3418:Boolean = false;
      
      private var var_2085:NftOutfit = null;
      
      private var var_2569:int;
      
      private var var_3772:Boolean = false;
      
      private var var_2660:class_900;
      
      private var var_807:String;
      
      private var var_3480:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
      
      private var var_3954:String = "M";
      
      private var var_3737:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
      
      private var var_4136:String = "M";
      
      public function HabboAvatarEditor(param1:uint, param2:com.sulake.habbo.avatar.HabboAvatarEditorManager, param3:Boolean = false)
      {
         super();
         var_3728 = param1;
         var_437 = param2;
         var_2566 = var_437.avatarRenderManager.getFigureData();
         var_3772 = param3;
      }
      
      public function dispose() : void
      {
         if(var_2660 != null)
         {
            var_437.communication.removeHabboConnectionMessageEvent(var_2660);
            var_2660 = null;
         }
         if(var_1298 != null)
         {
            for each(var _loc2_ in var_1298)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
            var_1298 = null;
         }
         if(var_2249 != null)
         {
            for each(var _loc1_ in var_2249)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_2249 = null;
         }
         if(var_1430 != null)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         var_2566 = null;
         var_2147 = null;
         var_2513 = null;
      }
      
      private function init(param1:Array = null) : void
      {
         if(var_1420)
         {
            return;
         }
         var_2660 = new class_900(onUserNftWardrobeMessage);
         var_437.communication.addHabboConnectionMessageEvent(var_2660);
         sendGetSelectedNftWardrobeOutfitMessage();
         var_1298 = new class_24();
         var_2249 = new class_24();
         var_2249.add("wardrobe",new WardrobeModel(this));
         var_1430 = new com.sulake.habbo.avatar.AvatarEditorView(this,param1);
         var_2147 = new Dictionary();
         var_2147["M"] = new FigureData(this);
         var_2147["F"] = new FigureData(this);
         var _loc3_:FigureData = var_2147["M"];
         var _loc2_:FigureData = var_2147["F"];
         _loc3_.loadAvatarData("hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007","M");
         _loc2_.loadAvatarData("hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68","F");
         var_1298.add("generic",new BodyModel(this));
         var_1298.add("head",new HeadModel(this));
         var_1298.add("torso",new TorsoModel(this));
         var_1298.add("legs",new LegsModel(this));
         if(param1 == null || param1.indexOf("hotlooks") > -1)
         {
            var_1298.add("hotlooks",new HotLooksModel(this));
         }
         var_1298.add("effects",new EffectsModel(this));
         var_1298.add("nfts",new NftAvatarsModel(this));
         var_1420 = true;
      }
      
      private function sendGetSelectedNftWardrobeOutfitMessage() : void
      {
         var_437.communication.connection.send(new class_717());
      }
      
      private function onUserNftWardrobeMessage(param1:class_900) : void
      {
         var_807 = param1.getParser().currentTokenId;
         var_3480 = param1.getParser().fallbackFigureString;
         var_3954 = param1.getParser().fallbackFigureGender;
         if(hasNftOutfit())
         {
            loadFallbackFigure();
         }
      }
      
      public function loadAvatarInEditor(param1:String, param2:String, param3:int = 0) : void
      {
         switch(param2)
         {
            case "M":
            case "m":
            case "M":
               param2 = "M";
               break;
            case "F":
            case "f":
            case "F":
               param2 = "F";
               break;
            default:
               param2 = "M";
         }
         this.clubMemberLevel = param3;
         var _loc4_:Boolean = false;
         var _loc5_:FigureData;
         if((_loc5_ = var_2147[param2]) == null)
         {
            return;
         }
         _loc5_.loadAvatarData(param1,param2);
         if(param2 != this.gender)
         {
            this.gender = param2;
            _loc4_ = true;
         }
         if(_figureString != param1)
         {
            _figureString = param1;
            _loc4_ = true;
         }
         if(var_1298 && _loc4_)
         {
            for each(var _loc6_ in var_1298)
            {
               _loc6_.reset();
            }
         }
         if(var_1430 != null)
         {
            var_1430.update();
         }
      }
      
      public function getFigureSetType(param1:String) : ISetType
      {
         if(var_2566 == null)
         {
            return null;
         }
         return var_2566.getSetType(param1);
      }
      
      public function getPalette(param1:int) : class_3220
      {
         if(var_2566 == null)
         {
            return null;
         }
         return var_2566.getPalette(param1);
      }
      
      public function openWindow(param1:com.sulake.habbo.avatar.class_3241, param2:Array = null, param3:Boolean = false, param4:String = null, param5:String = "generic") : class_3281
      {
         var_2513 = param1;
         var_3364 = param3;
         init(param2);
         selectDefaultCategory(param2,param5);
         return var_1430.getFrame(param2,param4);
      }
      
      public function embedToContext(param1:class_3151 = null, param2:com.sulake.habbo.avatar.class_3241 = null, param3:Array = null, param4:Boolean = false) : Boolean
      {
         var_2513 = param2;
         var_3364 = param4;
         init(param3);
         var_1430.embedToContext(param1,param3);
         selectDefaultCategory(param3);
         return true;
      }
      
      private function selectDefaultCategory(param1:Array, param2:String = "generic") : void
      {
         var _loc3_:Boolean = param1 != null && param1.length > 0;
         if(param2 != null && (!_loc3_ || param1.indexOf(param2) >= 0))
         {
            toggleAvatarEditorPage(param2);
         }
         else if(_loc3_)
         {
            toggleAvatarEditorPage(param1[0]);
         }
         else
         {
            toggleAvatarEditorPage("generic");
         }
      }
      
      public function get instanceId() : uint
      {
         return var_3728;
      }
      
      public function hide() : void
      {
         var_1430.hide();
      }
      
      public function getCategoryWindowContainer(param1:String) : class_3127
      {
         var _loc2_:class_3319 = var_1298.getValue(param1) as class_3319;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      public function activateCategory(param1:String) : void
      {
         var _loc2_:class_3319 = var_1298.getValue(param1) as class_3319;
         if(_loc2_)
         {
            _loc2_.switchCategory();
         }
      }
      
      public function getSideContentWindowContainer(param1:String) : class_3151
      {
         var _loc2_:ISideContentModel = var_2249.getValue(param1) as ISideContentModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      public function toggleAvatarEditorPage(param1:String) : void
      {
         if(var_1430)
         {
            var_1430.toggleCategoryView(param1,false);
         }
      }
      
      public function useClubClothing() : void
      {
         if(var_1298 == null)
         {
            return;
         }
         update();
      }
      
      public function disableClubClothing() : void
      {
         if(var_1298 == null)
         {
            return;
         }
         update();
      }
      
      public function get figureData() : FigureData
      {
         return var_2147[var_122];
      }
      
      public function saveCurrentSelection() : void
      {
         var _loc1_:String = figureData.getFigureString();
         var _loc2_:String = "null";
         if(var_2513 != null)
         {
            var_2513.saveFigure(_loc1_,_loc2_);
         }
         else
         {
            if(var_2085 != null)
            {
               var_437.communication.connection.send(new SaveUserNftWardrobeMessageComposer(var_2085.tokenId));
               sendGetSelectedNftWardrobeOutfitMessage();
               var_2085 = null;
            }
            else
            {
               var_437.communication.connection.send(new class_639(_loc1_,_loc2_));
            }
            if(hasNftOutfit())
            {
               var_807 = null;
            }
            var_437.events.dispatchEvent(new AvatarUpdateEvent(_loc1_));
            if(var_3418)
            {
               if(true)
               {
                  var_437.inventory.setEffectSelected(figureData.avatarEffectType);
               }
               else
               {
                  var_437.inventory.deselectAllEffects(true);
               }
            }
            var_3418 = false;
         }
      }
      
      public function generateDataContent(param1:class_3319, param2:String) : CategoryData
      {
         var _loc21_:int = 0;
         var _loc14_:class_3195 = null;
         var _loc9_:AvatarEditorGridPartItem = null;
         var _loc22_:ISetType = null;
         var _loc10_:class_3220 = null;
         var _loc13_:* = null;
         var _loc12_:Array = null;
         var _loc19_:Boolean = false;
         var _loc11_:int = 0;
         var _loc15_:* = false;
         var _loc18_:AvatarEditorGridColorItem = null;
         var _loc26_:int = 0;
         var _loc30_:Array = null;
         var _loc17_:int = 0;
         var _loc32_:* = false;
         var _loc33_:BitmapDataAsset = null;
         var _loc25_:BitmapData = null;
         var _loc24_:class_3151 = null;
         var _loc29_:* = false;
         var _loc31_:class_24 = null;
         var _loc16_:int = 0;
         var _loc27_:int = 0;
         var _loc6_:Boolean = false;
         var _loc34_:* = false;
         var _loc3_:Boolean = false;
         var _loc20_:BitmapDataAsset = null;
         var _loc23_:BitmapData = null;
         var _loc7_:class_3151 = null;
         var _loc5_:Array = null;
         if(!param1)
         {
            return null;
         }
         if(!param2)
         {
            return null;
         }
         var _loc4_:* = [];
         var _loc8_:* = [];
         _loc21_ = 0;
         while(_loc21_ < 2)
         {
            _loc8_.push([]);
            _loc21_++;
         }
         if(!(_loc22_ = getFigureSetType(param2)))
         {
            return null;
         }
         if(_loc22_ != null)
         {
            if(!(_loc10_ = getPalette(_loc22_.paletteID)))
            {
               return null;
            }
            if(!(_loc13_ = figureData.getColourIds(param2)))
            {
               _loc13_ = [];
            }
            _loc12_ = new Array(_loc13_.length);
            _loc19_ = showClubItemsDimmedConfiguration();
            for each(var _loc28_ in _loc10_.colors)
            {
               if(_loc28_.isSelectable && (_loc19_ || clubMemberLevel >= _loc28_.clubLevel))
               {
                  _loc11_ = 0;
                  while(_loc11_ < 2)
                  {
                     _loc15_ = clubMemberLevel < _loc28_.clubLevel;
                     _loc18_ = new AvatarEditorGridColorItem(com.sulake.habbo.avatar.AvatarEditorView.COLOUR_WINDOW.clone() as class_3151,param1,_loc28_,_loc15_);
                     _loc8_[_loc11_].push(_loc18_);
                     _loc11_++;
                  }
                  if(param2 != "hd")
                  {
                     _loc26_ = 0;
                     while(_loc26_ < _loc13_.length)
                     {
                        if(_loc28_.id == _loc13_[_loc26_])
                        {
                           _loc12_[_loc26_] = _loc28_;
                        }
                        _loc26_++;
                     }
                  }
               }
            }
            if(_loc19_)
            {
               _loc17_ = 2;
               _loc30_ = var_437.avatarRenderManager.getMandatoryAvatarPartSetIds(gender,_loc17_);
            }
            else
            {
               _loc30_ = var_437.avatarRenderManager.getMandatoryAvatarPartSetIds(gender,clubMemberLevel);
            }
            _loc32_ = _loc30_.indexOf(param2) == -1;
            if(_loc30_.indexOf(param2) == -1)
            {
               _loc25_ = ((_loc33_ = var_437.windowManager.assets.getAssetByName("avatar_editor_generic_remove_selection") as BitmapDataAsset).content as BitmapData).clone();
               (_loc24_ = com.sulake.habbo.avatar.AvatarEditorView.THUMB_WINDOW.clone() as class_3151).name = "REMOVE_ITEM";
               (_loc9_ = new AvatarEditorGridPartItem(_loc24_,param1,null,null,false)).iconImage = _loc25_;
               _loc4_.push(_loc9_);
            }
            _loc29_ = param2 != "hd";
            _loc27_ = (_loc16_ = int((_loc31_ = _loc22_.partSets).length)) - 1;
            while(_loc27_ >= 0)
            {
               _loc14_ = _loc31_.getWithIndex(_loc27_);
               _loc6_ = false;
               if(_loc14_.gender == "U")
               {
                  _loc6_ = true;
               }
               else if(_loc14_.gender == gender)
               {
                  _loc6_ = true;
               }
               if(_loc14_.isSelectable && _loc6_ && (_loc19_ || clubMemberLevel >= _loc14_.clubLevel))
               {
                  _loc34_ = clubMemberLevel < _loc14_.clubLevel;
                  _loc3_ = true;
                  if(_loc14_.isSellable)
                  {
                     _loc3_ = false && var_437.inventory.hasFigureSetIdInInventory(_loc14_.id) || isDevelopmentEditor();
                  }
                  if(_loc3_)
                  {
                     _loc9_ = new AvatarEditorGridPartItem(com.sulake.habbo.avatar.AvatarEditorView.THUMB_WINDOW.clone() as class_3151,param1,_loc14_,_loc12_,_loc29_,_loc34_);
                     _loc4_.push(_loc9_);
                  }
               }
               _loc27_--;
            }
         }
         _loc4_.sort(showClubItemsFirst ? orderByClubDesc : orderByClubAsc);
         if(var_3772 || var_437.getBoolean("avatareditor.support.sellablefurni"))
         {
            _loc23_ = ((_loc20_ = var_437.windowManager.assets.getAssetByName("camera_zoom_in") as BitmapDataAsset).content as BitmapData).clone();
            (_loc7_ = com.sulake.habbo.avatar.AvatarEditorView.THUMB_WINDOW.clone() as class_3151).name = "GET_MORE";
            (_loc9_ = new AvatarEditorGridPartItem(_loc7_,param1,null,null,false)).iconImage = _loc23_;
            _loc4_.push(_loc9_);
         }
         _loc21_ = 0;
         while(_loc21_ < 2)
         {
            (_loc5_ = _loc8_[_loc21_] as Array).sort(orderPaletteByClub);
            _loc21_++;
         }
         return new CategoryData(_loc4_,_loc8_);
      }
      
      public function isSideContentEnabled() : Boolean
      {
         return var_3364;
      }
      
      public function hasInvalidClubItems() : Boolean
      {
         var _loc1_:Boolean = false;
         for each(var _loc2_ in var_1298.getValues())
         {
            _loc1_ = _loc2_.hasClubItemsOverLevel(clubMemberLevel);
            if(_loc1_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasInvalidSellableItems() : Boolean
      {
         var _loc1_:Boolean = false;
         for each(var _loc2_ in var_1298.getValues())
         {
            _loc1_ = _loc2_.hasInvalidSellableItems(var_437.inventory);
            if(_loc1_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function stripClubItems() : void
      {
         for each(var _loc1_ in var_1298.getValues())
         {
            _loc1_.stripClubItemsOverLevel(clubMemberLevel);
         }
         figureData.updateView();
      }
      
      public function stripInvalidSellableItems() : void
      {
         for each(var _loc1_ in var_1298.getValues())
         {
            _loc1_.stripInvalidSellableItems();
         }
         figureData.updateView();
      }
      
      public function getDefaultColour(param1:String) : int
      {
         var _loc3_:class_3220 = null;
         var _loc2_:ISetType = getFigureSetType(param1);
         if(_loc2_ != null)
         {
            _loc3_ = getPalette(_loc2_.paletteID);
            for each(var _loc4_ in _loc3_.colors)
            {
               if(_loc4_.isSelectable && clubMemberLevel >= _loc4_.clubLevel)
               {
                  return _loc4_.id;
               }
            }
         }
         return -1;
      }
      
      private function orderByClubAsc(param1:AvatarEditorGridPartItem, param2:AvatarEditorGridPartItem) : Number
      {
         var _loc4_:Number = param1.partSet == null ? -1 : param1.partSet.clubLevel;
         var _loc5_:Number = param2.partSet == null ? -1 : param2.partSet.clubLevel;
         var _loc6_:Boolean = param1.partSet == null ? false : param1.partSet.isSellable;
         var _loc3_:Boolean = param2.partSet == null ? false : param2.partSet.isSellable;
         if(_loc6_ && !_loc3_)
         {
            return 1;
         }
         if(_loc3_ && !_loc6_)
         {
            return -1;
         }
         if(_loc4_ < _loc5_)
         {
            return -1;
         }
         if(_loc4_ > _loc5_)
         {
            return 1;
         }
         if(param1.partSet.id < param2.partSet.id)
         {
            return -1;
         }
         if(param1.partSet.id > param2.partSet.id)
         {
            return 1;
         }
         return 0;
      }
      
      private function orderByClubDesc(param1:AvatarEditorGridPartItem, param2:AvatarEditorGridPartItem) : Number
      {
         var _loc4_:Number = param1.partSet == null ? 9999999999 : param1.partSet.clubLevel;
         var _loc5_:Number = param2.partSet == null ? 9999999999 : param2.partSet.clubLevel;
         var _loc6_:Boolean = param1.partSet == null ? false : param1.partSet.isSellable;
         var _loc3_:Boolean = param2.partSet == null ? false : param2.partSet.isSellable;
         if(_loc6_ && !_loc3_)
         {
            return 1;
         }
         if(_loc3_ && !_loc6_)
         {
            return -1;
         }
         if(_loc4_ > _loc5_)
         {
            return -1;
         }
         if(_loc4_ < _loc5_)
         {
            return 1;
         }
         if(param1.partSet.id > param2.partSet.id)
         {
            return -1;
         }
         if(param1.partSet.id < param2.partSet.id)
         {
            return 1;
         }
         return 0;
      }
      
      private function orderPaletteByClub(param1:AvatarEditorGridColorItem, param2:AvatarEditorGridColorItem) : Number
      {
         var _loc3_:Number = param1.partColor == null ? -1 : param1.partColor.clubLevel as Number;
         var _loc4_:Number = param2.partColor == null ? -1 : param2.partColor.clubLevel as Number;
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partColor.index < param2.partColor.index)
         {
            return -1;
         }
         if(param1.partColor.index > param2.partColor.index)
         {
            return 1;
         }
         return 0;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function set gender(param1:String) : void
      {
         if(var_122 == param1)
         {
            return;
         }
         var_122 = param1;
         for each(var _loc2_ in var_1298)
         {
            _loc2_.reset();
         }
         if(var_1430 != null)
         {
            var_1430.update();
         }
      }
      
      public function get handler() : AvatarEditorMessageHandler
      {
         return var_437.handler;
      }
      
      public function get wardrobe() : WardrobeModel
      {
         if(!var_1420)
         {
            return null;
         }
         return var_2249.getValue("wardrobe");
      }
      
      public function get effects() : EffectsModel
      {
         if(!var_1420)
         {
            return null;
         }
         return var_1298.getValue("effects");
      }
      
      public function set clubMemberLevel(param1:int) : void
      {
         var_2569 = param1;
      }
      
      public function get clubMemberLevel() : int
      {
         if(!var_2569)
         {
            return var_437.sessionData.clubLevel;
         }
         return var_2569;
      }
      
      public function verifyClubLevel() : Boolean
      {
         return var_437.catalog.verifyClubLevel();
      }
      
      private function get showClubItemsFirst() : Boolean
      {
         return var_437.getBoolean("avatareditor.show.clubitems.first");
      }
      
      private function showClubItemsDimmedConfiguration() : Boolean
      {
         return var_437.getBoolean("avatareditor.show.clubitems.dimmed");
      }
      
      public function get manager() : com.sulake.habbo.avatar.HabboAvatarEditorManager
      {
         return var_437;
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_1298)
         {
            _loc1_.reset();
         }
         for each(_loc2_ in var_2249)
         {
            _loc2_.reset();
         }
         if(var_1430)
         {
            var_1430.update();
         }
      }
      
      public function setAvatarEffectType(param1:int) : void
      {
         figureData.avatarEffectType = param1;
         figureData.updateView();
         var_3418 = true;
      }
      
      public function setNftOutfit(param1:NftOutfit) : void
      {
         var_2085 = param1;
         var_3737 = figureData.getFigureString();
         var_4136 = figureData.gender;
      }
      
      public function hasSetNftOutfitInViewer() : Boolean
      {
         return var_2085 != null;
      }
      
      public function loadNftFigure() : void
      {
         var _loc1_:NftAvatarsModel = null;
         var _loc2_:NftOutfit = null;
         if(var_2085)
         {
            loadAvatarInEditor(var_2085.figure,var_2085.gender,var_2569);
         }
         else if(var_807 != null)
         {
            _loc1_ = var_1298.getValue("nfts");
            if(_loc1_)
            {
               _loc2_ = _loc1_.getNftAvatarByTokenId(var_807);
               if(_loc2_)
               {
                  setNftOutfit(_loc2_);
                  loadAvatarInEditor(_loc2_.figure,_loc2_.gender,var_2569);
               }
            }
         }
      }
      
      public function loadRollbackFigure() : void
      {
         if(var_2085)
         {
            loadAvatarInEditor(var_3737,var_4136,var_2569);
         }
      }
      
      public function loadFallbackFigure() : void
      {
         if(var_3480)
         {
            loadAvatarInEditor(var_3480,var_3954,var_2569);
         }
      }
      
      public function hasNftOutfit() : Boolean
      {
         return var_807 != null;
      }
      
      public function get view() : com.sulake.habbo.avatar.AvatarEditorView
      {
         return var_1430;
      }
      
      public function openHabboClubAdWindow() : void
      {
         if(false)
         {
            var_437.catalog.openClubCenter();
         }
      }
      
      public function isDevelopmentEditor() : Boolean
      {
         return var_3728 == 3;
      }
   }
}
