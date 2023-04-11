package com.sulake.habbo.avatar.structure.figure
{
   import com.sulake.core.utils.class_24;
   import flash.utils.Dictionary;
   
   public class SetType implements ISetType
   {
       
      
      private var var_1851:class_24;
      
      private var var_271:String;
      
      private var var_4255:int;
      
      private var var_2195:Dictionary;
      
      public function SetType(param1:XML)
      {
         super();
         var_271 = String(param1.@type);
         var_4255 = parseInt(param1.@paletteid);
         var_2195 = new Dictionary();
         var_2195["F"] = [];
         var_2195["M"] = [];
         var_2195["F"][0] = Boolean(parseInt(param1.@mand_f_0));
         var_2195["F"][1] = Boolean(parseInt(param1.@mand_f_1));
         var_2195["M"][0] = Boolean(parseInt(param1.@mand_m_0));
         var_2195["M"][1] = Boolean(parseInt(param1.@mand_m_1));
         var_1851 = new class_24();
         append(param1);
      }
      
      public function dispose() : void
      {
         for each(var _loc1_ in var_1851.getValues())
         {
            _loc1_.dispose();
         }
         var_1851.dispose();
         var_1851 = null;
      }
      
      public function cleanUp(param1:XML) : void
      {
         var _loc3_:String = null;
         var _loc2_:FigurePartSet = null;
         for each(var _loc4_ in param1["set"])
         {
            _loc3_ = String(_loc4_.@id);
            _loc2_ = var_1851.getValue(_loc3_);
            if(_loc2_ != null)
            {
               _loc2_.dispose();
               var_1851.remove(_loc3_);
            }
         }
      }
      
      public function append(param1:XML) : void
      {
         for each(var _loc2_ in param1["set"])
         {
            var_1851.add(String(_loc2_.@id),new FigurePartSet(_loc2_,var_271));
         }
      }
      
      public function getDefaultPartSet(param1:String) : class_3195
      {
         var _loc4_:int = 0;
         var _loc2_:class_3195 = null;
         var _loc3_:Array = var_1851.getKeys();
         _loc4_ = _loc3_.length - 1;
         while(_loc4_ >= 0)
         {
            _loc2_ = var_1851.getValue(_loc3_[_loc4_]);
            if(_loc2_ && _loc2_.clubLevel == 0 && (_loc2_.gender == param1 || _loc2_.gender == "U"))
            {
               return _loc2_;
            }
            _loc4_--;
         }
         return null;
      }
      
      public function getPartSet(param1:int) : class_3195
      {
         return var_1851.getValue(String(param1));
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get paletteID() : int
      {
         return var_4255;
      }
      
      public function isMandatory(param1:String, param2:int) : Boolean
      {
         return var_2195[param1.toUpperCase()][Math.min(param2,1)];
      }
      
      public function optionalFromClubLevel(param1:String) : int
      {
         var _loc2_:Array = var_2195[param1.toUpperCase()];
         return _loc2_.indexOf(false);
      }
      
      public function get partSets() : class_24
      {
         return var_1851;
      }
   }
}
