package com.sulake.habbo.avatar.structure.figure
{
   public class FigurePartSet implements IFigurePartSet
   {
       
      
      private var var_271:String;
      
      private var var_247:int;
      
      private var var_122:String;
      
      private var var_689:int;
      
      private var var_2800:Boolean;
      
      private var var_858:Boolean;
      
      private var var_1668:Array;
      
      private var _hiddenLayers:Array;
      
      private var var_4198:Boolean;
      
      private var var_1053:Boolean;
      
      public function FigurePartSet(param1:XML, param2:String)
      {
         var _loc3_:FigurePart = null;
         var _loc5_:int = 0;
         super();
         var_271 = param2;
         var_247 = parseInt(param1.@id);
         var_122 = String(param1.@gender);
         var_689 = parseInt(param1.@club);
         var_2800 = Boolean(parseInt(param1.@colorable));
         var_858 = Boolean(parseInt(param1.@selectable));
         var_4198 = Boolean(parseInt(param1.@preselectable));
         var_1053 = Boolean(parseInt(param1.@sellable));
         var_1668 = [];
         _hiddenLayers = [];
         for each(var _loc4_ in param1.part)
         {
            _loc3_ = new FigurePart(_loc4_);
            if((_loc5_ = indexOfPartType(_loc3_)) != -1)
            {
               var_1668.splice(_loc5_,0,_loc3_);
            }
            else
            {
               var_1668.push(_loc3_);
            }
         }
         for each(var _loc6_ in param1.hiddenlayers.layer)
         {
            _hiddenLayers.push(String(_loc6_.@parttype));
         }
      }
      
      public function dispose() : void
      {
         for each(var _loc1_ in var_1668)
         {
            _loc1_.dispose();
         }
         var_1668 = null;
         _hiddenLayers = null;
      }
      
      private function indexOfPartType(param1:FigurePart) : int
      {
         var _loc3_:int = 0;
         var _loc2_:FigurePart = null;
         _loc3_ = 0;
         while(_loc3_ < var_1668.length)
         {
            _loc2_ = var_1668[_loc3_];
            if(_loc2_.type == param1.type && _loc2_.index < param1.index)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function getPart(param1:String, param2:int) : class_3370
      {
         for each(var _loc3_ in var_1668)
         {
            if(_loc3_.type == param1 && _loc3_.id == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get clubLevel() : int
      {
         return var_689;
      }
      
      public function get isColorable() : Boolean
      {
         return var_2800;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_858;
      }
      
      public function get parts() : Array
      {
         return var_1668;
      }
      
      public function get hiddenLayers() : Array
      {
         return _hiddenLayers;
      }
      
      public function get isPreSelectable() : Boolean
      {
         return var_4198;
      }
      
      public function get isSellable() : Boolean
      {
         return var_1053;
      }
   }
}
